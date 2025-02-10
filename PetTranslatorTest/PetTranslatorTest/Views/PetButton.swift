//
//  PetButton.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 08.02.2025.
//

import Foundation
import UIKit
import SnapKit

class PetButton: UIButton {
    
    let petIcon = UIImageView(image: UIImage(named: "petIcon"))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    
    private func setupUI() {
        backgroundColor = .black
        layer.cornerRadius = 8
        petIcon.contentMode = .scaleAspectFit

        
        addSubview(petIcon)
        
        petIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
            
        }
    }
}
