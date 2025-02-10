//
//  CircleBackButton.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 10.02.2025.
//


import UIKit

class CircleBackButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        setImage(UIImage(named: "Close"), for: .normal)
        imageView?.contentMode = .scaleAspectFit 

        frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        widthAnchor.constraint(equalToConstant: 44).isActive = true
        heightAnchor.constraint(equalToConstant: 44).isActive = true

        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center

        backgroundColor = .white

        layer.cornerRadius = 22
        layer.masksToBounds = true

        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
    }
}
