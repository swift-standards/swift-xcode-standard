public import Xcode_Standard

extension Xcode.Workspace.Location.Scheme {
    public struct Token: Sendable, Equatable {
        public let rawValue: Swift.String

        public init?(rawValue: Swift.String) {
            guard !rawValue.isEmpty, !rawValue.contains(":"),
                !["group", "container", "absolute", "self"].contains(rawValue)
            else { return nil }
            self.rawValue = rawValue
        }
    }
}
