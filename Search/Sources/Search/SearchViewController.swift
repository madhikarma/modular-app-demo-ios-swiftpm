//
//  SearchViewController.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation
import SwiftUI
import UIKit

public final class SearchViewController: UIViewController {
    override public func loadView() {
        view = UIView()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = .blue
        title = "Search"
        tabBarItem.title = "Search"

        let searchView = SearchView()
        let controller = UIHostingController(rootView: searchView)
        addChild(controller)
        controller.didMove(toParent: self)

        view.addSubview(controller.view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
