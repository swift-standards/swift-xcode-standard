public import Xcode_Standard

extension Xcode.Scheme {
    public struct Build: Sendable, Equatable {
        public var reference: Reference

        public init(reference: Reference) {
            self.reference = reference
        }
    }
}
