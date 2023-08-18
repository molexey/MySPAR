//
//  TabBarController.swift
//  Мой SPAR
//
//  Created by molexey on 16.08.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Private properties
    
    private lazy var mainViewController = MainViewController()
    private lazy var catalogViewController = UIViewController()
    private lazy var shoppingCartViewController = UIViewController()
    private lazy var profileViewController = UIViewController()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        delegate = self
        tabBarController?.tabBar.isHidden = false
        
        view.backgroundColor = .white
        if #available(iOS 15, *) {
            let appearance: UITabBarAppearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = .sparLight
            appearance.stackedLayoutAppearance.normal.iconColor = .sparGray
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.sparGray]
            appearance.shadowImage = UIImage()
            appearance.shadowColor = .clear
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().tintColor = .sparGreen
        }
        else {
            tabBar.barTintColor = .darkGray
            tabBar.unselectedItemTintColor = .sparLight
            tabBar.tintColor = .sparGreen
        }
        
        setViewControllers([mainViewController, catalogViewController, shoppingCartViewController, profileViewController], animated: false)
        
        tabBar.items?[0].title = "Главная"
        tabBar.items?[0].image = UIImage(named: "Shape")
        tabBar.items?[1].title = "Каталог"
        tabBar.items?[1].image = UIImage(systemName: "square.grid.2x2")
        tabBar.items?[2].title = "Корзина"
        tabBar.items?[2].image = UIImage(systemName: "cart")
        tabBar.items?[3].title = "Профиль"
        tabBar.items?[3].image = UIImage(systemName: "person")
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowPath = UIBezierPath( rect: tabBar.bounds).cgPath
    }
}
