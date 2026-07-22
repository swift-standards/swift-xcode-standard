public import Xcode_Standard

extension Xcode.Scheme {
    /// Xcode's observed `BuildableReference` record.
    public struct Reference: Sendable, Equatable {
        public var identifier: Swift.String
        public var blueprint: Swift.String
        public var name: Swift.String
        public var container: Swift.String

        public init(
            identifier: Swift.String = "primary",
            blueprint: Swift.String,
            name: Swift.String,
            container: Swift.String
        ) {
            self.identifier = identifier
            self.blueprint = blueprint
            self.name = name
            self.container = container
        }
    }
}
