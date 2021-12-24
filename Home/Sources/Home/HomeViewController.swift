//
//  HomeViewController.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation
import Networking
import UIKit

public final class HomeViewController: UIViewController {
    private let network = Network()
    override public func loadView() {
        view = UIView()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Home"
        tabBarItem.title = "Home"

        network.sendRequest(urlString: "https://swapi.dev/api/films") { _, response, _ in
            print(response)
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "Debug", message: response.debugDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                }
                alertController.addAction(okAction)

                self.present(alertController, animated: true) {}
            }
        }
    }
}
