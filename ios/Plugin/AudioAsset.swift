import AVFoundation
import MediaPlayer

class AudioAsset: NSObject {
    private enum StatusEvent: String {
        case PLAYING
        case PAUSED
        case STOPPED
        case UNKNOWN
    }
    
    private weak var reference: AdvancedNativeAudioPlugin?
    
    private var params: AudioAssetOptions
    private var player: AVPlayer? = nil
    private var statusPlayer: StatusEvent = .UNKNOWN
    private var coverCache: [String : Data] = [:]
    
    private let nc = NotificationCenter.default
    private var playerItemContext = 0
    private var timeObserverToken: Any?
    
    deinit {
        debugPrint("AudioAsset: deinit")
        
        removePeriodicTimeObserver()
        
        nc.removeObserver(self)
    }
    
    class func loadAudioSession() throws {
        let session = AVAudioSession.sharedInstance()
        
        try session.setCategory(.playback)
        try session.setActive(false)
    }
    
    init?(reference: AdvancedNativeAudioPlugin, params: AudioAssetOptions) throws {
        self.reference = reference
        self.params = params
        
        super.init()
        
        try loadAsset()
        
        loadRemoteControl()
    }
    
    // MARK: - Private Methods

    private func updateInfo(reset: Bool = false) {
        func getArtwork() -> MPMediaItemArtwork? {
            guard let coverUrl = params.urlFromCover() else {
                return nil
            }
            
            guard let coverKey = coverUrl.absoluteString.base64 else {
                return nil
            }
            
            guard let cover = coverCache[coverKey], let image = UIImage(data: cover) else {
                if let coverData = try? Data(contentsOf: coverUrl), let image = UIImage(data: coverData) {
                    let artwork = MPMediaItemArtwork(boundsSize: image.size, requestHandler: {  (_) -> UIImage in
                        return image
                    })
                    
                    coverCache[coverKey] = coverData
                    
                    return artwork
                }
                
                return nil
            }
            
            let artwork = MPMediaItemArtwork(boundsSize: image.size, requestHandler: {  (_) -> UIImage in
                return image
            })
            
            return artwork
        }
        
        let commandInfo: MPNowPlayingInfoCenter = .default()
        var info: [String: Any] = [:]
        
        guard !reset else {
            commandInfo.nowPlayingInfo = nil
            
            return
        }
        
        info = [
            MPNowPlayingInfoPropertyElapsedPlaybackTime: getCurrentTime(),
            MPMediaItemPropertyPlaybackDuration: getDuration(),
            MPNowPlayingInfoPropertyPlaybackRate: player?.rate ?? 0.0
        ]
        
        if let albumLabel = params.album {
            info.updateValue(albumLabel, forKey: MPMediaItemPropertyAlbumTitle)
        }
        
        if let artistLabel = params.artist {
            info.updateValue(artistLabel, forKey: MPMediaItemPropertyArtist)
        }
        
        if let trackLabel = params.trackName {
            info.updateValue(trackLabel, forKey: MPMediaItemPropertyTitle)
        }
        
        DispatchQueue.global().async {
            if let artwork = getArtwork() {
                info.updateValue(artwork, forKey: MPMediaItemPropertyArtwork)
                
                commandInfo.nowPlayingInfo = info
            }
        }
        
        commandInfo.nowPlayingInfo = info
    }
    
    private func loadRemoteControl() {
        DispatchQueue.main.async {
            UIApplication.shared.beginReceivingRemoteControlEvents()
        }
        
        let commandCenter: MPRemoteCommandCenter = .shared()
        
        commandCenter.playCommand.isEnabled = true
        commandCenter.playCommand.addTarget { event in
            self.player?.play()
            
            return .success
        }
        
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.pauseCommand.addTarget { event in
            self.player?.pause()
            
            return .success
        }
        
        commandCenter.skipBackwardCommand.isEnabled = true
        commandCenter.skipBackwardCommand.preferredIntervals = [NSNumber(value: 15.0)]
        commandCenter.skipBackwardCommand.addTarget { event in
            guard let event = event as? MPSkipIntervalCommandEvent else {
                return .commandFailed
            }
            
            let currentTime = self.getCurrentTime()
            let offset = CMTimeMakeWithSeconds(event.interval, preferredTimescale: 1)
            let newTime = CMTimeSubtract(CMTime(seconds: currentTime, preferredTimescale: 1), offset)
            
            self.player?.seek(to: newTime, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero, completionHandler: { _ in
                self.updateInfo()
            })
            
            return .success
        }
        
        commandCenter.skipForwardCommand.isEnabled = true
        commandCenter.skipForwardCommand.preferredIntervals = [NSNumber(value: 15.0)]
        commandCenter.skipForwardCommand.addTarget { event in
            guard let event = event as? MPSkipIntervalCommandEvent else {
                return .commandFailed
            }
            
            let currentTime = self.getCurrentTime()
            let offset = CMTimeMakeWithSeconds(event.interval, preferredTimescale: 1)
            let newTime = CMTimeAdd(CMTime(seconds: currentTime, preferredTimescale: 1), offset)
            
            self.player?.seek(to: newTime, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero, completionHandler: { _ in
                self.updateInfo()
            })
            
            return .success
        }
        
        commandCenter.changePlaybackPositionCommand.isEnabled = true
        commandCenter.changePlaybackPositionCommand.addTarget { event in
            guard let event = event as? MPChangePlaybackPositionCommandEvent else {
                return .commandFailed
            }
            
            self.player?.currentItem?.seek(to: CMTimeMakeWithSeconds(event.positionTime, preferredTimescale: 1), completionHandler: { _ in
                self.updateInfo()
            })
            
            return .success
        }
    }
    
    private func loadAsset() throws {
        guard let url = params.urlAssetPath() else {
            throw AudioAssetError.assetPathIsNotValid
        }
        
        let item = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: item)
            player.volume = params.volume
                
        self.player = player
        
        addPeriodicTimeObserver()
        addAVPlayerItemObserver()
        addAVPlayerObserver()
        
        updateInfo()
    }
    
    private func sendEventListener(status: StatusEvent) {
        statusPlayer = status
        
        reference?.notifyListeners("playbackStateChanged", data: [
            "status": statusPlayer.rawValue,
            "position": getCurrentTime(),
            "assetId": params.assetId
        ])
    }
}

// MARK: - Player Methods

extension AudioAsset {
    func play(time: TimeInterval) {
        player?.currentItem?.seek(to: CMTimeMakeWithSeconds(params.time, preferredTimescale: 1), completionHandler: nil)
        player?.play()
        
        updateInfo()
    }
    
    func pause() {
        player?.pause()
        
        updateInfo()
    }
    
    func resume() {
        guard let player = self.player else {
            return
        }
        
        let timeOffset = CMTimeMakeWithSeconds(
            CMTimeGetSeconds(player.currentTime()),
            preferredTimescale: player.currentTime().timescale
        )
        
        player.seek(to: timeOffset)
        player.play()
        
        updateInfo()
    }
    
    func stop() {
        player?.pause()
        
        updateInfo()
    }
    
    func getVolume() -> Float {
        player?.volume ?? 0.0
    }
    
    func setVolume(value: Float) {
        switch value {
        case let v where v < 0.0:
            player?.volume = 0.0
            
        case let v where v > 1.0:
            player?.volume = 1.0
            
        default:
            player?.volume = value
        }
    }
    
    func unload() {
        stop()
        
        removePeriodicTimeObserver()
        
        player = nil
    }
    
    func getCurrentTime() -> Double {
        player?.currentItem?.currentTime().seconds ?? 0.0
    }
    
    func setCurrentTime(value: Double) {
        player?.currentItem?.seek(to: CMTimeMakeWithSeconds(value, preferredTimescale: 1), completionHandler: nil)
        
        updateInfo()
    }
    
    func getDuration() -> Double {
        if player?.currentItem?.status == .readyToPlay {
            return player?.currentItem?.duration.seconds ?? 0.0
        }
        
        return 0.0
    }
}

// MARK: - Handler Methods

extension AudioAsset {
    private func addAVPlayerObserver() {
        player?.addObserver(
            self,
            forKeyPath: #keyPath(AVPlayer.rate),
            options: [.new],
            context: &playerItemContext
        )
    }
    
    private func addAVPlayerItemObserver() {
        player?.addObserver(
            self,
            forKeyPath: #keyPath(AVPlayer.rate),
            options: [.new],
            context: &playerItemContext
        )
        
        nc.addObserver(
            self,
            selector: #selector(eventAVPlayerItemDidPlayToEndTime(notify:)),
            name: .AVPlayerItemDidPlayToEndTime,
            object: nil
        )
    }
    
    private func addPeriodicTimeObserver() {
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 1.0, preferredTimescale: timeScale)

        timeObserverToken = player?.addPeriodicTimeObserver(forInterval: time, queue: .main) { [weak self] time in
            guard let self = self else {
                return
            }
            
            if self.statusPlayer != .PAUSED, self.statusPlayer != .UNKNOWN {
                self.sendEventListener(status: .PLAYING)
            }
        }
    }

    private func removePeriodicTimeObserver() {
        if let timeObserverToken = timeObserverToken {
            player?.removeTimeObserver(timeObserverToken)
            
            self.timeObserverToken = nil
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard context == &playerItemContext else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            
            return
        }
        
        if keyPath == #keyPath(AVPlayer.rate) {
            let rateValue = (change?[.newKey] as? NSNumber) ?? 0.0
            
            switch rateValue {
            case 0:
                sendEventListener(status: .PAUSED)
                
            default:
                sendEventListener(status: .PLAYING)
            }
        }
    }
    
    @objc private func eventAVPlayerItemDidPlayToEndTime(notify: NSNotification) {
        sendEventListener(status: .STOPPED)
        
        updateInfo(reset: true)
    }
}
