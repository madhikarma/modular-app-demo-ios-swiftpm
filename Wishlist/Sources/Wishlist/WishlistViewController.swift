//
//  WishlistViewController.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021. ;mok,k>;/'|//

import Foundation
import UIKit

public final class WishlistViewController: UIViewController {
    override public func loadView() {
        view = UIView()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = .green
    }
}
