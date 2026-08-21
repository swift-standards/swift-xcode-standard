import Testing
import Xcode_Workspace_Standard

@Test
func `workspace models observed locations`() {
    let workspace = Xcode.Workspace(references: [
        .init(location: .init(scheme: .group, path: "Application")),
        .init(location: .init(scheme: .group, path: "Packages/a&b")),
        .init(location: .init(scheme: .container, path: "../Package")),
        .init(location: .init(scheme: .absolute, path: "/tmp/Package")),
        .init(location: .init(scheme: .self, path: "")),
        .init(
            location: .init(
                scheme: .other(.init(rawValue: "future")!),
                path: "Package"
            )
        ),
    ])

    #expect(
        workspace.references.map(\.location.rawValue) == [
            "group:Application",
            "group:Packages/a&b",
            "container:../Package",
            "absolute:/tmp/Package",
            "self:",
            "future:Package",
        ]
    )
}

@Test(
    arguments: [
        "group:Application",
        "container:../Package",
        "absolute:/tmp/Package",
        "self:",
        "future:Package",
    ]
)
func `workspace location round trips`(_ rawValue: String) {
    #expect(Xcode.Workspace.Location(rawValue: rawValue)?.rawValue == rawValue)
}

@Test
func `workspace location rejects missing or empty schemes`() {
    #expect(Xcode.Workspace.Location(rawValue: "Package") == nil)
    #expect(Xcode.Workspace.Location(rawValue: ":Package") == nil)
}
