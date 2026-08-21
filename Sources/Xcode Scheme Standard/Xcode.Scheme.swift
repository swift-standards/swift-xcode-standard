public import Xcode_Standard

extension Xcode {

    public struct Scheme: Sendable, Equatable {
        public var version: Swift.String
        public var build: [Build]
        public var test: [Test]

        public init(
            version: Swift.String = "1.7",
            build: [Build],
            test: [Test]
        ) {
            self.version = version
            self.build = build
            self.test = test
        }
    }
}
