enum AudioAssetError: Error {
    case assetIdNotFound
    case assetPathIsNotValid
}

struct AudioAssetMessage {
    static let kAssetIdNotFound = "AssetID not found"
    static let kPreloadAssetError = "Preload asset error"
}
