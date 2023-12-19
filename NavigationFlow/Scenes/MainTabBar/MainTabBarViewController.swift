//
//  MainTabBarViewController.swift
//  NavigationFlow
//
//  Created by Javier Cueto on 18/12/23.
//

import UIKit

final class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        let controllerOne = UIViewController()
        let controllerOneNav = UINavigationController(rootViewController: controllerOne)
        controllerOne.view.backgroundColor = .white
        controllerOne.title = "Home"
        controllerOneNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let controllerTwo = UIViewController()
        let controllerTwoNav = UINavigationController(rootViewController: controllerTwo)
        controllerTwo.view.backgroundColor = .white
        controllerTwo.title = "Search"
        controllerTwoNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        
        let controllerThree = SettingsTableViewController()
        controllerThree.delegate = self
        let controllerThreeNav = UINavigationController(rootViewController: controllerThree)
        controllerThree.view.backgroundColor = .white
        controllerThree.title = "Settings"
        controllerThreeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(systemName: "gear.circle.fill"))
        
        viewControllers = [controllerOneNav, controllerTwoNav, controllerThreeNav]
    }

}

extension MainTabBarViewController: SettingsTableViewControllerDelegate {
    func didSelectLogout() {
        let loginController = LoginViewController(loginSession: LoginSessionImp())
        loginController.title = "Login"
        navigationController?.viewControllers = [loginController]
    }
}
