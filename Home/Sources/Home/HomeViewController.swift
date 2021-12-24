//
//  HomeViewController.swift
//
//
//  Created by Shagun Madhikarmi on 24/12/2021.
//

import Foundation
import StarWarsAPI
import UIKit

public final class HomeViewController: UIViewController {
    private let starWarsAPIClient = StarWarsAPIClient()

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
//        starWarsAPIClient.getMovies { result in
//            switch result {
//            case let .success(response):
//                print(response)
//            case let .failure(error):
//                print(error)
//            }
//        }
    }
}
