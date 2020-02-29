//
//  SceneDelegate.swift
//  AppOfThrones
//
//  Created by Eva Gonzalez Ferreira on 11/02/2020.
//  Copyright © 2020 Eva Gonzalez Ferreira. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let episodeViewController  = EpisodeViewController()
        let castViewController     = CastViewController()
        let housesViewController   = HousesViewController()
        let settingsViewController = SettingsViewController()
        let favViewController      = FavoritesViewController()

        // Comunicación de Settings con Episodes mediante Delegates
        settingsViewController.episodesDelegate = episodeViewController

        
        episodeViewController.tabBarItem  = UITabBarItem.init(title: "Seasons", image: UIImage.init(systemName: "film.fill"), tag: 0)
        castViewController.tabBarItem     = UITabBarItem.init(title: "Cast", image: UIImage.init(systemName: "person.3.fill"), tag: 1)
        housesViewController.tabBarItem     = UITabBarItem.init(title: "Houses", image: UIImage.init(systemName: "shield.lefthalf.fill"), tag: 1)
        settingsViewController.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage.init(systemName: "gear"), tag: 2)
        favViewController.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage.init(systemName: "heart.fill"), tag: 3)
        
        // NavigationController
        let navigationEpisodeViewController  = UINavigationController.init(rootViewController: episodeViewController)
        let navigationCastViewController     = UINavigationController.init(rootViewController: castViewController)
        let navigationHousesViewController   = UINavigationController.init(rootViewController: housesViewController)
        let navigationSettingsViewController = UINavigationController.init(rootViewController: settingsViewController)
        let navigationFavoriteViewController = UINavigationController.init(rootViewController: favViewController)
        
        // TabBarController
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationEpisodeViewController, navigationCastViewController, navigationHousesViewController, navigationSettingsViewController, navigationFavoriteViewController]
        
        tabBarController.tabBar.barStyle = .black
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.tintColor = UIColor.init(red: 235/255.0, green: 172/255.0, blue: 38/255.0, alpha: 1.0)
        
        UINavigationBar.appearance().overrideUserInterfaceStyle = .dark
        UINavigationBar.appearance().tintColor = UIColor.init(red: 235/255.0, green: 172/255.0, blue: 38/255.0, alpha: 1.0)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

// Debido al bug del tapbar
extension UINavigationController {
   open override var preferredStatusBarStyle: UIStatusBarStyle {
      return topViewController?.preferredStatusBarStyle ?? .default
   }
}
