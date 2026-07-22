# swift-xcode-standard

![Development Status](https://img.shields.io/badge/status-provisional-orange.svg)

Foundation-free semantic models for Xcode workspace and shared-scheme documents.

> This Layer-2 placement is provisional: Apple documents Xcode behavior but does not publish a complete serialization specification. The package therefore models only researched, fixture-verified fields and does not claim unsupported format coverage.

---

## Quick Start

```swift
import Xcode_Workspace_Standard

let workspace = Xcode.Workspace(references: [
    .init(location: .group("Application")),
    .init(location: .group("Packages/swift-json"))
])
```

Serialization and file operations belong to [swift-xcode](https://github.com/swift-foundations/swift-xcode).

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-standards/swift-xcode-standard.git", branch: "main")
]
```

Products:

- `Xcode Workspace Standard` exposes `Xcode.Workspace`.
- `Xcode Scheme Standard` exposes `Xcode.Scheme`.

### Requirements

- Swift 6.3+
- Apple platforms 26+

---

## Community

<!-- BEGIN: discussion -->
*Discussion thread will be created at the first public release.*
<!-- END: discussion -->

---

## License

Apache 2.0. See [LICENSE](LICENSE.md).
