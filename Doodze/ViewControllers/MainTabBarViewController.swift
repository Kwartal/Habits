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
        
        let vc1 = UINavigationController(rootViewController: TimersViewController())
        let vc2 = UINavigationController(rootViewController: AddressSearchViewController())
        let vc3 = UINavigationController(rootViewController: ProfileViewController())
//        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "clock.arrow.2.circlepath")
        vc2.tabBarItem.image = UIImage(systemName: "timer")
        vc3.tabBarItem.image = UIImage(systemName: "person.crop.circle")
//        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        // FIXME: - Локализация

        tabBar.tintColor = .label
        setViewControllers([vc1, vc2, vc3], animated: true)
    }


}


