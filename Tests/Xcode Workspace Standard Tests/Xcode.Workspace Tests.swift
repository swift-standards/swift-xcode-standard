import Testing
import Xcode_Workspace_Standard

@Test
func `workspace models observed locations`() {
    let workspace = Xcode.Workspace(references: [
        .init(location: .group("Application")),
        .init(location: .group("Packages/a&b")),
        .init(location: .self)
    ])

    #expect(workspace.references.map(\.location.rawValue) == [
        "group:Application", "group:Packages/a&b", "self:"
    ])
}
