//
//  RepeatButton.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 10.02.2025.
//


import UIKit
class RepeatButton: UIButton {
    init() {
        super.init(frame: .zero)

        var configuration = UIButton.Configuration.filled()
        configuration.imagePadding = 8
        configuration.baseBackgroundColor = AppColors.speechBubbleColor
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        self.setTitle("Repeat", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = .Konkhmer.Regular.size(of: 12)
        self.setImage(UIImage(named: "repeat"), for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.configuration = configuration

      
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
