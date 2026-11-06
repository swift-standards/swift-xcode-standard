public import Xcode_Standard

extension Xcode {

    public struct Scheme: Sendable, Equatable {
        // swift-linter:disable:next raw concept
        // REASON: A scheme file's version attribute such as 1.7, Xcode's own format number; looked at Version.Semantic and Version.Tools, neither of which it is.
        public var version: Swift::String
        public var build: [Build]
        public var test: [Test]

        public init(
            // swift-linter:disable:next raw concept
            // REASON: A scheme file's version attribute such as 1.7, Xcode's own format number; looked at Version.Semantic and Version.Tools, neither of which it is.
            version: Swift::String = "1.7",
            build: [Build],
            test: [Test]
        ) {
            self.version = version
            self.build = build
            self.test = test
        }
    }
}
