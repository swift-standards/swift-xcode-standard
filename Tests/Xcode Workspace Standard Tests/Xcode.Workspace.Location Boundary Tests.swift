import Testing
import Xcode_Workspace_Standard

@Test
func `workspace location rejects an empty string and a bare separator`() {
    #expect(Xcode.Workspace.Location(rawValue: "") == nil)
    #expect(Xcode.Workspace.Location(rawValue: ":") == nil)
}

@Test
func `workspace location splits at the first separator only`() {
    let location = Xcode.Workspace.Location(rawValue: "group:a:b")

    #expect(location?.scheme == .group)
    #expect(location?.path == "a:b")
    #expect(location?.rawValue == "group:a:b")
}

@Test
func `workspace location scheme names are case sensitive`() {
    let location = Xcode.Workspace.Location(rawValue: "Group:Package")

    #expect(location?.scheme == .other(.init(rawValue: "Group")!))
}

@Test
func `workspace scheme token rejects empty and separator-bearing values`() {
    #expect(Xcode.Workspace.Location.Scheme.Token(rawValue: "") == nil)
    #expect(Xcode.Workspace.Location.Scheme.Token(rawValue: "a:b") == nil)
    #expect(Xcode.Workspace.Location.Scheme.Token(rawValue: "future")?.rawValue == "future")
}

@Test
func `workspace defaults to format version one`() {
    let workspace = Xcode.Workspace(references: [])

    #expect(workspace.version == "1.0")
    #expect(workspace.references.isEmpty)
}

@Test(arguments: ["group", "container", "absolute", "self"])
func `workspace scheme token rejects reserved scheme names`(_ rawValue: String) {
    #expect(Xcode.Workspace.Location.Scheme.Token(rawValue: rawValue) == nil)
}
