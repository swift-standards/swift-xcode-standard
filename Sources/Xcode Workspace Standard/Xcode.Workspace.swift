public import Xcode_Standard

extension Xcode {
    /// An Xcode workspace document.
    public struct Workspace: Sendable, Equatable {
        public var version: Swift.String
        public var references: [Reference]

        public init(
            version: Swift.String = "1.0",
            references: [Reference]
        ) {
            self.version = version
            self.references = references
        }
    }
}
