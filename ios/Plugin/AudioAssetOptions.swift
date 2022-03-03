import Capacitor

struct AudioAssetOptions {
    struct ConstantKey {
        static let keyAssetId = "assetId"
        static let keyAssetPath = "assetPath"
        static let keyVolume = "volume"
        static let keyTime = "time"
        static let keyAlbum = "album"
        static let keyArtist = "artist"
        static let keyTrackName = "trackName"
        static let keyCover = "cover"
    }
    
    let assetId: String
    let assetPath: String
    let volume: Float
    let time: Double
    let album: String?
    let artist: String?
    let trackName: String?
    let cover: String?
    
    init?(call: CAPPluginCall) throws {
        guard let assetId = call.getString(ConstantKey.keyAssetId) else {
            throw AudioAssetError.assetIdNotFound
        }
        
        self.assetId = assetId
        self.assetPath = call.getString(ConstantKey.keyAssetPath, "")
        self.volume = call.getFloat(ConstantKey.keyVolume, 1.0)
        self.time = call.getDouble(ConstantKey.keyTime, 0.0)
        self.album = call.getString(ConstantKey.keyAlbum)
        self.artist = call.getString(ConstantKey.keyArtist)
        self.trackName = call.getString(ConstantKey.keyTrackName)
        self.cover = call.getString(ConstantKey.keyCover)
    }
}

// MARK: - Helper Methods

extension AudioAssetOptions {
    /// Convert path in URL
    ///
    /// For development reasons it was required to manage this logic
    func urlAssetPath() -> URL? {
        switch assetPath {
        case let path where path.isEmpty:
            return nil
            
        case let path where path.lowercased().hasPrefix("http://") || path.lowercased().hasPrefix("https://"):
            return URL(string: path)
            
        case let path where path.lowercased().hasPrefix("file://"):
            return URL(fileURLWithPath: path)
            
        case let path:
            return Bundle.main.url(forResource: path, withExtension: nil)
        }
    }
    
    /// Convert cover in URL
    func urlFromCover() -> URL? {
        guard let coverUrl = cover, let url = URL(string: coverUrl) else {
            return nil
        }
        
        return url
    }
}
