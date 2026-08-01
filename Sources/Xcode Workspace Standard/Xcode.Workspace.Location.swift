public import Xcode_Standard

extension Xcode.Workspace {
    public enum Location: Sendable, Equatable {
        case group(Swift.String)
        case absolute(Swift.String)
        case `self`
    }
}

extension Xcode.Workspace.Location {
    public var rawValue: Swift.String {
        switch self {
        case .group(let path): "group:\(path)"
        case .absolute(let path): "absolute:\(path)"
        case .self: "self:"
        }
    }

    public init?(rawValue: Swift.String) {
        if rawValue == "self:" {
            self = .self
        } else if rawValue.hasPrefix("group:") {
            self = .group(Swift.String(rawValue.dropFirst(6)))
        } else if rawValue.hasPrefix("absolute:") {
            self = .absolute(Swift.String(rawValue.dropFirst(9)))
        } else {
            return nil
        }
    }
}
