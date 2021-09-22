#!/bin/bash

echo "Building Xcode project for testing (Simulator)..."
xcodebuild -workspace ./ModularDemoApp.xcworkspace -scheme ModularDemoApp -clonedSourcePackagesDirPath SourcePackages -configuration "Debug" -sdk "iphonesimulator" -destination "platform=iOS Simulator,name=iPhone 8,OS=14.5" build-for-testing | xcpretty
