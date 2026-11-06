public import Xcode_Standard

extension Xcode {

    public struct Workspace: Sendable, Equatable {
        // swift-linter:disable:next raw concept
        // REASON: A workspace file's version attribute such as 1.0, Xcode's own format number; looked at Version.Semantic and Version.Tools, neither of which it is.
        public var version: Swift::String
        public var references: [Reference]

        public init(
            // swift-linter:disable:next raw concept
            // REASON: A workspace file's version attribute such as 1.0, Xcode's own format number; looked at Version.Semantic and Version.Tools, neither of which it is.
            version: Swift::String = "1.0",
            references: [Reference]
        ) {
            self.version = version
            self.references = references
        }
    }
}
