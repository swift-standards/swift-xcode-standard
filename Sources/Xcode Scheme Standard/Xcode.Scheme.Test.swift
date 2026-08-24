public import Xcode_Standard

extension Xcode.Scheme {
    public struct Test: Sendable, Equatable {
        public var reference: Reference
        public var skipped: Swift.Bool
        public var parallelizable: Swift.Bool

        public init(
            reference: Reference,
            skipped: Swift.Bool = false,
            parallelizable: Swift.Bool = false
        ) {
            self.reference = reference
            self.skipped = skipped
            self.parallelizable = parallelizable
        }
    }
}
