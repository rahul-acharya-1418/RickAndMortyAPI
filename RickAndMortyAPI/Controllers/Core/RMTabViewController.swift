//
//  RMTabViewController.swift
//  RickAndMortyAPI
//
//  Created by Rahul Acharya on 2023-01-09.
//

import UIKit

/// Controller to house tabs and root tab controller
final class RMTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
        
    }
    
    private func setUpTabs(){
        let charactersVC = RMCharacterViewController(),
            locationsVC = RMLocationViewController(),
            episodesVC = RMEpisodeViewController(),
            settingsVC = RMSettingsViewController()
        
        for changeVC in [charactersVC, locationsVC, episodesVC, settingsVC] {
            changeVC.navigationItem.largeTitleDisplayMode = .automatic
        }
        
        
        
        
        let nav1 = UINavigationController(rootViewController: charactersVC),
            nav2 = UINavigationController(rootViewController: locationsVC),
            nav3 = UINavigationController(rootViewController: episodesVC),
            nav4 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        for nav in   [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2, nav3, nav4],
            animated: true)
    }
    
    
}

