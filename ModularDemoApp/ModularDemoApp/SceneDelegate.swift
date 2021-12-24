//
//  SceneDelegate.swift
//  ModularDemoApp
//
//  Created by Shagun on 18/09/2021.
//

import Home
import Login
import Search
import UIKit
import Wishlist

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        let homeViewController = HomeViewController()
        let homeTabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
        homeViewController.tabBarItem = homeTabBarItem
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.navigationBar.backgroundColor = .white

        let searchViewController = SearchViewController()
        let searchTabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)
        searchViewController.tabBarItem = searchTabBarItem
        let searchNavigationController = UINavigationController(rootViewController: searchViewController)
        searchNavigationController.navigationBar.backgroundColor = .white

        let wishlistViewController = WishlistViewController()
        let wishlistTabBarItem = UITabBarItem(title: "Wishlist", image: UIImage(systemName: "star"), selectedImage: nil)
        wishlistViewController.tabBarItem = wishlistTabBarItem
        let wishlistNavigationController = UINavigationController(rootViewController: wishlistViewController)
        wishlistNavigationController.navigationBar.backgroundColor = .white

        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.isTranslucent = false
        tabBarController.viewControllers = [homeNavigationController, searchNavigationController, wishlistNavigationController]

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
