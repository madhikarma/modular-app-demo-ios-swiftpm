#!/bin/bash

# date
# date +"%s"
# var=$(date)
# var=`date`


# Clean default SPM Cache
# Note. only used when -clonedSourcePackagesDirPath is not provided i.e. Xcode GUI
# echo "Deleting default SwiftPM cache..."
# rm -rf ~/Library/Caches/org.swift.swiftpm/
# mkdir ~/Library/Caches/org.swift.swiftpm/

# Clean Derived Data
# echo "Deleting Derived Data..."
# echo $(date)
# rm -rf ~/Library/Developer/Xcode/DerivedData/

# Clean custom SwiftPM Cache
# echo "Deleting custom SwiftPM cache..."
# echo $(date)
# rm -rf ./SourcePackages

# Checkout SwiftPM Dependencies
# echo "Checking out SwiftPM dependencies (into default location)..."
# Note. uses ~/Library/Caches/org.swift.swiftpm cache
# xcodebuild -resolvePackageDependencies -workspace ./ModularDemoApp.xcworkspace -scheme ModularDemoApp -scmProvider xcode 

# Clean Xcode build artefacts
# echo "Clean Xcode build folders..."
# echo $(date)
# rm -rf ModularDemoApp/builds
# rm -rf FeatureA/builds
# rm -rf FeatureLogin/builds
# rm -rf SharedA/builds

# Setup Xcode build threads
# echo "Setup Xcode build threads..."
# defaults write com.apple.Xcode PBXNumberOfParallelBuildSubtasks 16
# echo $(date)

echo "Checking out SwiftPM dependencies into custom location..."
echo $(date)
# Note. does NOT use ~/Library/Caches/org.swift.swiftpm cache due to -clonedSourcePackagesDirPath
xcodebuild -workspace ./ModularDemoApp.xcworkspace -scheme ModularDemoApp -clonedSourcePackagesDirPath SourcePackages -scmProvider xcode -resolvePackageDependencies


echo "Building Xcode project..."
echo $(date)
xcodebuild -workspace ./ModularDemoApp.xcworkspace -scheme ModularDemoApp -clonedSourcePackagesDirPath SourcePackages -configuration "Debug" -sdk "iphonesimulator" -destination "generic/platform=iOS Simulator" clean build | xcpretty
echo $(date)