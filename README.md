# swift-xcode-standard

Use this package when you need an Xcode workspace or shared scheme as values, for example to generate one. Start from `Xcode.Workspace` in the `Xcode Workspace Standard` product or `Xcode.Scheme` in the `Xcode Scheme Standard` product. They model only the fields seen in real files, and they don't read or write the XML. To read and write the files, use swift-xcode.

## Laws

- A workspace location's text form is the scheme, a colon and the path. `Xcode.Workspace.Location.init(rawValue:)` splits at the first colon, so the path may itself contain colons, and the path may be empty, as in `self:`.
- Text with no colon or with nothing before the first colon is refused.
- Scheme names are case-sensitive. Any scheme other than `group`, `container`, `absolute` and `self` is kept as `Xcode.Workspace.Location.Scheme.other(_:)`, so `Group` is an unknown scheme. An `Xcode.Workspace.Location.Scheme.Token` can't be one of those four names, so each scheme has one representation and a location read from its own text form is equal to the original.
