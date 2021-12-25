//
//  HomeViewController.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation
import SwiftUI
import UIKit

public final class HomeViewController: UIViewController {
    // MARK: - View lifecycle

    override public func loadView() {
        view = UIView()
    }

    override public func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Home"
        tabBarItem.title = "Home"

        print(Date())

        let homeView = HomeView()
        let controller = UIHostingController(rootView: homeView)
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        controller.didMove(toParent: self)

        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
