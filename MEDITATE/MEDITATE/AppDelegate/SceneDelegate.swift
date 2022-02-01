//
//  SceneDelegate.swift
//  MEDITATE
//
//  Created by FOLAHANMI KOLAWOLE on 23/09/2021.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    let onboardingViewController = OnboardingViewController()
    let signupVC = SignUpEmailViewController()
    let homePageVC = HomeTabBarController()
    var navigationController = UINavigationController()
    if UserDefaults.standard.bool(forKey: "onboarded") == false {
        navigationController = UINavigationController(rootViewController: onboardingViewController)
    } else {
//        if a user is already logged in, then the first viewcontroller displayed should be the homescreen view controller.
        if FirebaseAuth.Auth.auth().currentUser != nil {
            navigationController = UINavigationController(rootViewController: homePageVC)
        } else {
            navigationController = UINavigationController(rootViewController: signupVC)
        }
    }
    navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController.navigationBar.shadowImage = UIImage()
      window = UIWindow(frame: windowScene.coordinateSpace.bounds)
      window?.windowScene = windowScene
      window?.rootViewController = navigationController
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
