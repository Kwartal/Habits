//
//  MainTabBarViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.11.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let vc1 = UINavigationController(rootViewController: HabitsViewController())
        let vc2 = UINavigationController(rootViewController: MotivationViewController())
        let vc3 = UINavigationController(rootViewController: ProfileViewController())
        let vc4 = UINavigationController(rootViewController: DogsViewController())

        vc1.tabBarItem.image = UIImage(systemName: "clock.arrow.2.circlepath")
        vc2.tabBarItem.image = UIImage(systemName: "pencil.circle")
        vc3.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        vc4.tabBarItem.title = "Dogs"

        tabBar.tintColor = .black
        tabBar.isTranslucent = false

        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }

}


