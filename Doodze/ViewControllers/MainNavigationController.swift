//
//  MainNavigationController.swift
//  mapATM
//
//  Created by Aleksei on 16.02.2023.
//

import UIKit

final class MainNavigationController: UINavigationController {
    
    // MARK: - Settings StatusBarStyle

    private var osTheme: UIUserInterfaceStyle {
        return UIScreen.main.traitCollection.userInterfaceStyle
    }
    
    override internal var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle(
            rawValue: (
                topViewController?.preferredStatusBarStyle)!.rawValue
        ) ?? .default
    }
    
    // MARK: - Public override Methods
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    
        setupStyleNavBar()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

    // MARK: - Settings Style NavigationBar

private extension MainNavigationController {
     func setupStyleNavBar() {
         let navBarAppearance = UINavigationBarAppearance()
         navBarAppearance.backgroundColor = .systemBackground
         navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
         UINavigationBar.appearance().standardAppearance = navBarAppearance
         UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
         UINavigationBar.appearance().prefersLargeTitles = false
     }
}

