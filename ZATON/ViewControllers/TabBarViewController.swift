//
//  TabBarViewController.swift
//  ZATON
//
//  Created by Константин on 05.04.2021.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate, UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.delegate = self
        self.view.tintColor = UIColor(red: 0.1412, green: 0.7608, blue: 0.451, alpha: 1)
        
        let catalogViewController = UINavigationController(rootViewController: CatalogViewController())
        catalogViewController.title = "Каталог"
        catalogViewController.tabBarItem = UITabBarItem(title: catalogViewController.title, image: UIImage(named: "catalog"), selectedImage: UIImage(named: "catalogGreen"))
        
        let discountsViewController = DiscountsViewController()
        discountsViewController.title = "Акции"
        discountsViewController.tabBarItem = UITabBarItem(title: discountsViewController.title, image: UIImage(named: "persent"), selectedImage: UIImage(named: "persentGreen"))
        
        let shoppingCartViewController = ShoppingCartViewController()
        shoppingCartViewController.title = "Корзина"
        shoppingCartViewController.tabBarItem = UITabBarItem(title: shoppingCartViewController.title, image: UIImage(named: "smallCart"), selectedImage: UIImage(named: "smallCartGreen"))
        
        let recomendedViewController = RecomendedViewController()
        recomendedViewController.title = "Поиск"
        recomendedViewController.tabBarItem = UITabBarItem(title: recomendedViewController.title, image: UIImage(named: "search"), selectedImage: UIImage(named: "searchGreen"))
        
        let entryAccountViewController = EntryAccountViewController()
        entryAccountViewController.title = "Личное"
        entryAccountViewController.tabBarItem = UITabBarItem(title: entryAccountViewController.title, image: UIImage(named: "smallPerson"), selectedImage: UIImage(named: "smallPersonGreen"))
        
        
        self.viewControllers = [catalogViewController, discountsViewController, shoppingCartViewController, recomendedViewController, entryAccountViewController]
        
    }
    
}


