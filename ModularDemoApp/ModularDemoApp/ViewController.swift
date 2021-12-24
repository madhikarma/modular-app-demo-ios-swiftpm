//
//  ViewController.swift
//  ModularDemoApp
//
//  Created by Shagun on 18/09/2021.
//

import FeatureA
import SharedA
import UIKit
// import FeatureLogin

final class ViewController: UIViewController {
    let featureAViewController = FeatureAViewController()
//    let loginViewController = LoginViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        let result = FeatureA.FeatureUtil().someFeatureUtilFunction()
//        print(result)
//
//        let persistence = Persistence()
//        let directory = persistence.getDirectory()
//        print(directory)
//        let categories = persistence.categories
//        print(categories)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        featureAViewController.delegate = self
        present(featureAViewController, animated: true) {
            self.featureAViewController.updateBackgroundColor()
        }

//        loginViewController.delegate = self
//        present(loginViewController, animated: true)
    }
}

extension ViewController: FeatureAViewControllerDelegate {
    func didPresent() {
        print(#function)
    }

    func didConfirm() {
        print(#function)
        featureAViewController.dismiss(animated: true, completion: nil)
    }
}

// extension ViewController: LoginViewControllerDelegate {
//
//    func loginViewControllerDidComplete(_ viewController: LoginViewController) {
//        viewController.dismiss(animated: true, completion: nil)
//    }
// }
