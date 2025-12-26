# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

This project uses xcodegen to generate the Xcode project. Common commands via justfile:

```bash
just generate    # Generate Xcode project from project.yml
just open        # Open Xcode project
just build       # Build debug configuration
just clean       # Clean build and derived data
just setup       # Generate and open project
```

Set `DEVELOPMENT_TEAM` environment variable for code signing.

## Architecture

SwiftUI iOS app (iOS 17.0+, Swift 5.9) for guitar tablature display with loop selection.

### Core Components

- **ContentView** - Main screen with LazyVStack of TabCell items
- **TabCell** - Displays song info over background image, contains Selector overlay, calculates beat positions from cell width
- **Selector** - Beat-snapping loop selection UI with draggable left/right handles. Uses beat indices (not pixel positions) for discrete step selection
- **Tab** - Model with title, artist, beatCount

### Key Patterns

- Selector receives `beatPositions: [CGFloat]` array and bindings to `startBeat`/`endBeat` indices
- Handle images (HandleLeft.svg, HandleRight.svg) from Figma design in Assets.xcassets
- Selection rectangle uses `dragZoneOffset` to inset from handles

## Design System

- Don't leave comments in the code
- Handle assets sourced from Figma: `8uIvW3czEXJ6JG99w9bi0D`
- Selection fill color: `rgba(118, 118, 128, 0.15)` with 8px corner radius
