import Testing
import Xcode_Workspace_Standard

@Test
func `workspace models observed locations`() {
    let workspace = Xcode.Workspace(references: [
        .file(.init(scheme: .group, path: "Application")),
        .file(.init(scheme: .group, path: "Packages/a&b")),
        .file(.init(scheme: .container, path: "../Package")),
        .file(.init(scheme: .absolute, path: "/tmp/Package")),
        .file(.init(scheme: .self, path: "")),
        .file(
            .init(
                scheme: .other(.init(rawValue: "future")!),
                path: "Package"
            )
        ),
    ])

    #expect(
        workspace.references.compactMap { reference in
            switch reference {
            case .file(let location): location.rawValue
            case .group: nil
            }
        } == [
            "group:Application",
            "group:Packages/a&b",
            "container:../Package",
            "absolute:/tmp/Package",
            "self:",
            "future:Package",
        ]
    )
}

@Test
func `workspace preserves nested reference hierarchy`() {
    let file = Xcode.Workspace.Reference.file(.init(scheme: .group, path: "Package"))
    let group = Xcode.Workspace.Reference.group(
        .init(
            name: "Packages",
            location: .init(scheme: .container, path: ""),
            references: [file]
        )
    )

    #expect(Xcode.Workspace(references: [group]).references == [group])
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
