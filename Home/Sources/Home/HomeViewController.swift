//
//  HomeViewController.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation
import UIKit

public final class HomeViewController: UIViewController {
    override public func loadView() {
        view = UIView()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
