//
//  TabBarViewController.swift
//  DZ_2_modul3
//
//  Created by Nikita Shipovskiy on 30/05/2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        
    }
    
    
    private func setupTabBar() {
        let mainVc = MainViewController()
        mainVc.tabBarItem.title = "Главная"
        mainVc.tabBarItem.image = UIImage(systemName: "house")
        mainVc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let newsVc = UpcomingViewController()
        newsVc.tabBarItem.title = "Cкоро"
        newsVc.tabBarItem.image = UIImage(systemName: "newspaper")
        newsVc.tabBarItem.selectedImage = UIImage(systemName: "newspaper.fill")
        
        let profileVc = ProfileViewController()
        profileVc.tabBarItem.title = "Профиль"
        profileVc.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        profileVc.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")
        
        tabBar.tintColor = UIColor(named: "mainColor")
        tabBar.unselectedItemTintColor = .lightGray
        
        let navMainVc = UINavigationController(rootViewController: mainVc)
        let navNewsVc = UINavigationController(rootViewController: newsVc)
        let navProfileVc = UINavigationController(rootViewController: profileVc)
        
        setViewControllers([navMainVc, navNewsVc, navProfileVc], animated: true)
        
    }
    


}
