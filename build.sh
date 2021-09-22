#!/bin/bash

echo "Building Xcode project (Simulator)..."
xcodebuild -workspace ./ModularDemoApp.xcworkspace -scheme ModularDemoApp -clonedSourcePackagesDirPath SourcePackages -configuration "Debug" -sdk "iphonesimulator" -destination "generic/platform=iOS Simulator" clean build | xcpretty
