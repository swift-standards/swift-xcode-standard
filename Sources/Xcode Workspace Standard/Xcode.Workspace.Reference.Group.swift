public import Xcode_Standard

extension Xcode.Workspace.Reference {
    public struct Group: Sendable, Equatable {
        public let name: Swift.String
        public let location: Xcode.Workspace.Location
        public let references: [Xcode.Workspace.Reference]

        public init(
            name: Swift.String,
            location: Xcode.Workspace.Location,
            references: [Xcode.Workspace.Reference]
        ) {
            self.name = name
            self.location = location
            self.references = references
        }
    }
}
