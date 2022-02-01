//
//  HomeTabBarController.swift
//  MEDITATE
//
//  Created by  Decagon on 03/10/2021.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = .label
        DispatchQueue.main.async {
            self.tabBar.shadowImage = UIImage()
            self.tabBar.backgroundImage = UIImage()
            self.tabBar.backgroundColor = .white
            self.tabBarController?.tabBar.isHidden = true
        }
        setupVCs()
    }
    fileprivate func createNavController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = true
           return navController
       }
    func setupVCs() {
            viewControllers = [
                createNavController(for: HomeViewController(), image: UIImage(named: "HomeIcon")!),
                createNavController(for: ExploreViewController(), image: UIImage(named: "Icon")!),
                createNavController(for: ProfileViewController(), image: UIImage(named: "profileIcon")!)
            ]
        }
}
