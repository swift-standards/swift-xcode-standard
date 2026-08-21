public import Xcode_Standard

extension Xcode.Workspace {
    public indirect enum Reference: Sendable, Equatable {
        case file(Location)
        case group(Group)
    }
}
