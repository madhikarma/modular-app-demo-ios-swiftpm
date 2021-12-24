//
//  HomeViewController.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation
import SharedA
import UIKit

public final class HomeViewController: UIViewController {
    override public func loadView() {
        view = UIView()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Home"
        tabBarItem.title = "Home"

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
}
