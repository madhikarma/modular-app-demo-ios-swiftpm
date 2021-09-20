//
//  File.swift
//
//
//  Created by Shagun on 19/09/2021.
//

import Foundation
import UIKit


public protocol LoginViewControllerDelegate: AnyObject {
    func loginViewControllerDidComplete(_ viewController: LoginViewController)
}

public class LoginViewController: UIViewController {
    
    public weak var delegate: LoginViewControllerDelegate?
    
    // MARK: - View Lifecycle
    
    public override func loadView() {
        view = LoginView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        guard let loginView = view as? LoginView else { return }
        loginView.usernameTextField.delegate = self
        loginView.passwordTextField.delegate = self

//        let result = FeatureA.FeatureUtil().someFeatureUtilFunction()
//        print(result)
//
//        let persistence = Persistence()
//        let directory = persistence.getDirectory()
//        print(directory)
//        let categories = persistence.categories
//        print(categories)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        featureAViewController.delegate = self
//        present(featureAViewController, animated: true) {
//            self.featureAViewController.updateBackgroundColor()
//        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let loginView = view as? LoginView else { return false }

        if textField == loginView.passwordTextField {
            // TODO: (SM) make API request to login then complete
            delegate?.loginViewControllerDidComplete(self)
            return true
            
        } else if textField == loginView.usernameTextField {
            loginView.passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
