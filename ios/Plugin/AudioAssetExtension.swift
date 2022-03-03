extension String {
    var base64: String? {
        self.data(using: .utf8)?.base64EncodedString(options: .lineLength64Characters)
    }
}
