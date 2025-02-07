//
//  MainTabBarController.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//

import UIKit

class MainTabBarController: UITabBarController {
    let tabBarAppearance = UITabBarAppearance()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = TranslatorViewController()
        let secondVC = SettingsViewController()
        
        firstVC.tabBarItem = UITabBarItem(title: "Translator", image: UIImage(named: "Translator"), selectedImage: nil)
        secondVC.tabBarItem = UITabBarItem(title: "Clicker", image: UIImage(named: "Settings"), selectedImage: nil)
        
       
        let firstNavController = UINavigationController(rootViewController: firstVC)
        let secondNavController = UINavigationController(rootViewController: secondVC)
        
        self.viewControllers = [firstNavController, secondNavController]
        setupTabBar()
    }
    
    
    private func setupTabBar() {
        let desiredWidth: CGFloat = 216
        let desiredHeight: CGFloat = 82
        let positionOnX: CGFloat = (tabBar.bounds.width - desiredWidth) / 2 // Center horizontally
        let positionOnY: CGFloat = 30 // Adjust as needed
        
        let width = desiredWidth
        let height = desiredHeight
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY, // Adjust vertical position
                width: width,
                height: height
            ),
            cornerRadius: 16
        )
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.white.cgColor // Set fill color
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        // Adjust item width if needed (216 / 5 might be too narrow)
        tabBar.itemWidth = width / 5  // or a larger value
        tabBar.itemPositioning = .centered
        
        if let items = tabBar.items {
            for item in items {
                
                item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.Konkhmer.Regular.size(of: 16)], for: .normal)
                item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.Konkhmer.Regular.size(of: 16)], for: .selected)
            }
        }
            roundLayer.fillColor = UIColor.white.cgColor
            
            tabBar.tintColor = AppColors.main
        
    }
}

