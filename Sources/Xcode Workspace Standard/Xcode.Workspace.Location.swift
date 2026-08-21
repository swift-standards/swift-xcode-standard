public import Xcode_Standard

extension Xcode.Workspace {
    public struct Location: Sendable, Equatable {
        public let scheme: Scheme
        public let path: Swift.String

        public init(scheme: Scheme, path: Swift.String) {
            self.scheme = scheme
            self.path = path
        }
    }
}

extension Xcode.Workspace.Location {
    public var rawValue: Swift.String {
        "\(scheme.rawValue):\(path)"
    }

    public init?(rawValue: Swift.String) {
        guard let separator = rawValue.firstIndex(of: ":") else { return nil }
        let rawScheme = Swift.String(rawValue[..<separator])
        guard let scheme = Scheme(rawValue: rawScheme) else { return nil }

        self.init(
            scheme: scheme,
            path: Swift.String(rawValue[rawValue.index(after: separator)...])
        )
    }
}
