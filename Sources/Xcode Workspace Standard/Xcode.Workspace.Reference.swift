public import Xcode_Standard

extension Xcode.Workspace {
    public struct Reference: Sendable, Equatable {
        public var location: Location

        public init(location: Location) {
            self.location = location
        }
    }
}
