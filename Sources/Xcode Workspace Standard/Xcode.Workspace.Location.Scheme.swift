public import Xcode_Standard

extension Xcode.Workspace.Location {
    public enum Scheme: Sendable, Equatable {
        case group
        case container
        case absolute
        case `self`
        case other(Token)
    }
}

extension Xcode.Workspace.Location.Scheme {
    public var rawValue: Swift.String {
        switch self {
        case .group: "group"
        case .container: "container"
        case .absolute: "absolute"
        case .self: "self"
        case .other(let token): token.rawValue
        }
    }

    public init?(rawValue: Swift.String) {
        switch rawValue {
        case "group": self = .group
        case "container": self = .container
        case "absolute": self = .absolute
        case "self": self = .self
        default:
            guard let token = Token(rawValue: rawValue) else { return nil }
            self = .other(token)
        }
    }
}
