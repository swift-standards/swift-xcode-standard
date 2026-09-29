import Testing
import Xcode_Scheme_Standard

@Test
func `scheme defaults to format version one point seven with no actions`() {
    let scheme = Xcode.Scheme(build: [], test: [])

    #expect(scheme.version == "1.7")
    #expect(scheme.build.isEmpty)
    #expect(scheme.test.isEmpty)
}

@Test
func `scheme test and reference defaults`() {
    let reference = Xcode.Scheme.Reference(blueprint: "b", name: "n", container: "container:c")
    let test = Xcode.Scheme.Test(reference: reference)

    #expect(reference.identifier == "primary")
    #expect(!test.skipped)
    #expect(!test.parallelizable)
}
