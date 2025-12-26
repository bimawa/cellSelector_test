default:
    @just --list

generate:
    xcodegen generate

open:
    open Songsterr.xcodeproj

build:
    xcodebuild -project Songsterr.xcodeproj -scheme Songsterr -configuration Debug build

clean:
    xcodebuild -project Songsterr.xcodeproj -scheme Songsterr clean
    rm -rf ~/Library/Developer/Xcode/DerivedData/Songsterr-*

setup: generate open
