import Alamofire
import FBSnapshotTestCase
@testable import FeatureA
import XCTest

final class FeatureATests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//            XCTAssertEqual(FeatureA().text, "Hello, World!")
    }
}

class FeatureASnapshotTest: FBSnapshotTestCase {
    private var referenceImageDirectory: String?
    private var imageDiffDirectory: String?

    override func setUp() {
        super.setUp()
    }

    func testFeatureAViewControllerSnapshot() {
        let featureViewController = FeatureAViewController()

        featureViewController.loadViewIfNeeded()

        // Uncomment to trigger snapshot failure since its red by default internally
        // featureViewController.view.backgroundColor = .blue

        let featureView = featureViewController.view!

        verify(view: featureView)
    }

    // TODO: (SM) move to base / helper class
    public func verify(
        view: UIView,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let directory = ("\(file)" as NSString).deletingLastPathComponent

        // Save for later use in getReferenceImageDirectory
        referenceImageDirectory = NSString.path(withComponents: [directory, "ReferenceImages"])

        // Save for later use in getImageDiffDirectory
        imageDiffDirectory = NSString.path(withComponents: [directory, "FailedSnapshotTests"])

        FBSnapshotVerifyView(
            view,
            identifier: nil,
            perPixelTolerance: 0,
            overallTolerance: 0,
            file: file,
            line: line
        )
    }

    override open func getReferenceImageDirectory(withDefault _: String?) -> String {
        guard let referenceImageDirectory = referenceImageDirectory else {
            fatalError("Do not call FBSnapshotVerifyView directly, use WazeSnapshotTestCase.verify instead.")
        }
        return referenceImageDirectory
    }

    override open func getImageDiffDirectory(withDefault _: Swift.String?) -> Swift.String {
        guard let imageDiffDirectory = imageDiffDirectory else {
            fatalError("Do not call FBSnapshotVerifyView directly, use WazeSnapshotTestCase.verify instead.")
        }

        return imageDiffDirectory
    }
}
