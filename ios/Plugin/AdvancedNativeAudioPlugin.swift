import AVFoundation
import Capacitor
import CoreAudio

@objc(AdvancedNativeAudioPlugin)
public class AdvancedNativeAudioPlugin: CAPPlugin {
    private var audioCache: [String: AudioAsset] = [:]

    public override func load() {
        super.load()

        do {
            try AudioAsset.loadAudioSession()

        } catch {
            debugPrint("AdvancedNativeAudioPlugin: Load Audio Session Error...")
        }
    }

    // MARK: - Private Methods

    private func preloadAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let asset = audioCache[params.assetId]
        let queue = DispatchQueue(label: "native.audio.preloadasset.queue", qos: .userInitiated)

        queue.async {
            guard asset == nil else {
                call.resolve()

                return
            }

            do {
                let audioAsset = try AudioAsset(reference: self, params: params)

                self.audioCache[params.assetId] = audioAsset

                call.resolve()

            } catch {
                call.reject(AudioAssetMessage.kPreloadAssetError)
            }
        }
    }

    private func playAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.playasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            asset.play(time: params.time)

            call.resolve()
        }
    }

    private func pauseAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.pauseasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            asset.pause()

            call.resolve()
        }
    }

    private func resumeAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.resumeasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            asset.resume()

            call.resolve()
        }
    }

    private func stopAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.stopasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            asset.stop()

            call.resolve()
        }
    }

    private func getVolumeAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.getvolumeasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            let result = asset.getVolume()

            call.resolve(["volume": result])
        }
    }

    private func setVolumeAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.setvolumeasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            asset.setVolume(value: params.volume)

            call.resolve()
        }
    }

    private func unloadAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.unloadasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            asset.unload()

            self.audioCache[params.assetId] = nil

            call.resolve()
        }
    }

    private func getCurrentTimeAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.getcurrenttimeasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            let result = asset.getCurrentTime()

            call.resolve(["time": result])
        }
    }

    private func setCurrentTimeAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.setcurrenttimeasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            asset.setCurrentTime(value: params.time)

            call.resolve()
        }
    }

    private func getDurationAsset(_ call: CAPPluginCall) {
        guard let params = try? AudioAssetOptions(call: call) else {
            call.reject(AudioAssetMessage.kAssetIdNotFound)

            return
        }

        let queue = DispatchQueue(label: "native.audio.getdurationasset.queue", qos: .userInitiated)

        queue.async {
            guard let asset = self.audioCache[params.assetId] else {
                call.reject(AudioAssetMessage.kAssetIdNotFound)

                return
            }

            let result = asset.getDuration()

            call.resolve(["duration": result])
        }
    }
}

// MARK: Capacitor Interface

extension AdvancedNativeAudioPlugin {
    @objc func preload(_ call: CAPPluginCall) {
        preloadAsset(call)
    }

    @objc func play(_ call: CAPPluginCall) {
        playAsset(call)
    }

    @objc func resume(_ call: CAPPluginCall) {
        resumeAsset(call)
    }

    @objc func pause(_ call: CAPPluginCall) {
        pauseAsset(call)
    }

    @objc func stop(_ call: CAPPluginCall) {
        stopAsset(call)
    }

    @objc func unload(_ call: CAPPluginCall) {
        unloadAsset(call)
    }

    @objc func setVolume(_ call: CAPPluginCall) {
        setVolumeAsset(call)
    }

    @objc func getVolume(_ call: CAPPluginCall) {
        getVolumeAsset(call)
    }

    @objc func getCurrentTime(_ call: CAPPluginCall) {
        getCurrentTimeAsset(call)
    }

    @objc func setCurrentTime(_ call: CAPPluginCall) {
        setCurrentTimeAsset(call)
    }

    @objc func getDuration(_ call: CAPPluginCall) {
        getDurationAsset(call)
    }
}
