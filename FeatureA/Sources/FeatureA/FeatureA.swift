import SharedA

public class FeatureUtil {
    public func someFeatureUtilFunction() -> String {
        let result = SharedA.SharedUtil().someSharedUtilFunction()

        return "someFeatureFunction - \(result)"
    }

    public init() {}
}

import UIKit

public protocol FeatureAViewControllerDelegate: AnyObject {
    func didConfirm()
    func didPresent()
}

public class FeatureAViewController: UIViewController {
    private let networking = Networking()
    public weak var delegate: FeatureAViewControllerDelegate?

    override public func viewDidLoad() {
        super.viewDidLoad()

        updateBackgroundColor()
        networking.sendJSONRequest(url: URL(string: "https://swapi.dev/api/films")!) { response in
            print(response)
            let alertController = UIAlertController(title: "Debug", message: response.debugDescription, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                self.delegate?.didConfirm()
            }
            alertController.addAction(okAction)

            self.present(alertController, animated: true) {
                self.delegate?.didPresent()
            }
        }
    }

    public func someOtherFunction() {}

    public func updateBackgroundColor() {
        view.backgroundColor = .red
    }
}
