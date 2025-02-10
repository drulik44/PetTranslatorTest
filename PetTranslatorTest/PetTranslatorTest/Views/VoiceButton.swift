//
//  VoiceButton.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 07.02.2025.
//


import UIKit
import SnapKit
import Lottie

class VoiceButton: UIButton {
    
    public let micIcon = UIImageView(image: UIImage(named: "microphone-2"))
    public let label = UILabel()
    public let animationView = LottieAnimationView(name: "voice-NH2Fe1vRAY") 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        layer.cornerRadius = 20
        backgroundColor = .white
        
        label.text = "Start Speak"
        label.font = .Konkhmer.Regular.size(of:16)
        label.textColor = AppColors.main
        label.textAlignment = .center
        
        micIcon.contentMode = .scaleAspectFit
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.isHidden = true
        
        addSubview(micIcon)
        addSubview(animationView)
        addSubview(label)
        
        micIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(70)
        }
        
        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(163)
            make.height.equalTo(70)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(micIcon.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
    }
    
   
}
