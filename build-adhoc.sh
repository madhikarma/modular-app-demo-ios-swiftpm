#!/bin/bash

# fail if any commands fails
set -e
# debug log
set -x

echo "Building Xcode project for (adhoc) distribution (Device)..."
xcodebuild -workspace ./ModularDemoApp.xcworkspace -scheme ModularDemoApp -clonedSourcePackagesDirPath SourcePackages -sdk iphoneos -configuration AdHoc archive -archivePath $BITRISE_SOURCE_DIR/build/ModularDemoApp.xcarchive | xcpretty
xcodebuild -exportArchive -archivePath $BITRISE_SOURCE_DIR/build/ModularDemoApp.xcarchive -exportPath $BITRISE_SOURCE_DIR/build/ModularDemoApp.ipa -exportOptionsPlist exportOptions.plist | xcpretty
