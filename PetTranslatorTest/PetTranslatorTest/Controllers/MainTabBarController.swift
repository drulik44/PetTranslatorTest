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
        let positionOnX: CGFloat = (tabBar.bounds.width - desiredWidth) / 2
        let positionOnY: CGFloat = 46

        let width = desiredWidth
        let height = desiredHeight

        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: 16
        )
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.white.cgColor
        tabBar.layer.insertSublayer(roundLayer, at: 0)

        tabBar.itemSpacing = 25
        tabBar.itemPositioning = .centered
        tabBar.layoutMargins = .zero

        let items = tabBar.items ?? []
        let barButtonItems = tabBar.subviews.compactMap { $0 as? UIControl }
        let itemCount = items.count

        for (index, barButtonItem) in barButtonItems.enumerated() {
            let itemWidth = width / CGFloat(itemCount)
            let xPos = positionOnX + CGFloat(index) * itemWidth

            let yPos: CGFloat = -25
            
            barButtonItem.frame = CGRect(x: xPos, y: yPos, width: itemWidth, height: tabBar.bounds.height - yPos)
        }

        for item in items {
            item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.Konkhmer.Regular.size(of: 16)], for: .normal)
            item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.Konkhmer.Regular.size(of: 16)], for: .selected)
            
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -25)
            item.imageInsets = UIEdgeInsets(top: -30, left: 0, bottom: 10, right: 0)
        
        }

        tabBar.tintColor = AppColors.main
    }
}
