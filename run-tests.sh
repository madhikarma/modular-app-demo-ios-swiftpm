#!/bin/bash
# fail if any commands fails
set -e
# debug log
set -x

echo "Running prebuilt tests.."
xcodebuild -workspace ./ModularDemoApp.xcworkspace -scheme ModularDemoApp -clonedSourcePackagesDirPath SourcePackages -configuration "Debug" -sdk "iphonesimulator" -destination "platform=iOS Simulator,name=iPhone 8,OS=14.5" test-without-building | xcpretty
