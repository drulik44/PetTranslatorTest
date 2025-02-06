//
//  ViewController.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Создание градиентного слоя
               let gradientLayer = CAGradientLayer()
               gradientLayer.frame = self.view.bounds
               
               // Использование цветов из AppColors
               gradientLayer.colors = [AppColors.mainPaint2.cgColor, AppColors.mainPaint.cgColor]
               
               // Направление градиента (сверху вниз)
               gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
               gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
               
               // Добавление градиентного слоя на экран
               self.view.layer.insertSublayer(gradientLayer, at: 0)
           

        let helloLabel: UILabel = {
            let label = UILabel()
            label.text = "Hello, World!"
            label.font = .Konkhmer.Regular.size(of: 20)
            label.textColor = AppColors.topography
            return label
        }()

        view.addSubview(helloLabel)

        helloLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
}
