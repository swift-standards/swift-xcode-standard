import Testing
import Xcode_Scheme_Standard

@Test
func `scheme models build and test references`() {
    let reference = Xcode.Scheme.Reference(
        blueprint: "Workspace-Package",
        name: "Workspace-Package",
        container: "container:Application"
    )
    let scheme = Xcode.Scheme(
        build: [.init(reference: reference)],
        test: [.init(reference: reference)]
    )

    #expect(scheme.build.map(\.reference) == [reference])
    #expect(scheme.test.map(\.reference) == [reference])
}
