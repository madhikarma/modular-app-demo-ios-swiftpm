//
//  SearchViewController.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation
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
    }
}
