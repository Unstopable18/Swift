//
//  ViewController.swift
//  RickAndMorty
//
//  Created by CEMTREX on 14/09/23.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupTabs()
    }
    
    private func setupTabs(){
        let charactersVC        = RMCharacterViewController()
        let locationsVC         = RMLocationViewController()
        let episodesVC          = RMEpisodeViewController()
        let settingsVC          = RMSettingViewController()
            
        charactersVC.title      = "Characters"
        locationsVC.title       = "Locations"
        episodesVC.title        = "Episodes"
        settingsVC.title        = "Settings"
        
        charactersVC.navigationItem.largeTitleDisplayMode   = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode    = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode     = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode     = .automatic
        
        
        let navCharacter        = UINavigationController(rootViewController: charactersVC)
        let navLocation         = UINavigationController(rootViewController: locationsVC)
        let navEpisode          = UINavigationController(rootViewController: episodesVC)
        let navSetting          = UINavigationController(rootViewController: settingsVC)
        
        navCharacter.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        navLocation.tabBarItem  = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        navEpisode.tabBarItem   = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        navSetting.tabBarItem   = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        for nav in [
            navCharacter,
            navLocation,
            navEpisode,
            navSetting
        ]{
            nav.navigationBar.prefersLargeTitles=true
        }
        
        setViewControllers([
            navCharacter,
            navLocation,
            navEpisode,
            navSetting
        ], animated: true)
    }
}

