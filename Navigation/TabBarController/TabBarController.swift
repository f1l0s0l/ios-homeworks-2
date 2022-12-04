//
//  TabBarController.swift
//  Navigation
//
//  Created by Илья Сидорик on 04.12.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    var lineTabNavigationController: UINavigationController!
    var infoTabNavigationController: UINavigationController!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        lineTabNavigationController = UINavigationController.init(rootViewController: FeedViewController())
        infoTabNavigationController = UINavigationController.init(rootViewController: ProfileViewController())
        
        self.viewControllers = [lineTabNavigationController, infoTabNavigationController]
        
        let item1 = UITabBarItem(title: "Feed",
                                 image: UIImage(systemName: "square.stack.3d.down.right"), tag: 0)
        
        let item2 = UITabBarItem(title: "Profile",
                                 image: UIImage(systemName: "person.crop.circle"), tag: 1)
        
        lineTabNavigationController.tabBarItem = item1
        infoTabNavigationController.tabBarItem = item2
        
        UITabBar.appearance().tintColor = UIColor(red: 225/255.0, green: 225/255.0, blue: 225/255.0, alpha: 1.0)
        UITabBar.appearance().backgroundColor = .gray
        
        
        
    
        
        
        
        
        
        
    }
    
    
    
}
