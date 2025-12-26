# Songsterr

SwiftUI iOS app for guitar tablature display with loop selection.

## Requirements

- iOS 17.0+
- Xcode 15.0+
- [xcodegen](https://github.com/yonaskolb/XcodeGen)
- [just](https://github.com/casey/just)

## Setup

```bash
brew install xcodegen just
just setup
```

## Commands

```bash
just generate    # Generate Xcode project
just open        # Open in Xcode
just build       # Build debug
just clean       # Clean build artifacts
```

## Features

- Lazy-loading tab list with background images
- Beat-snapping loop selector with draggable handles
- Discrete step selection aligned to tablature beats
