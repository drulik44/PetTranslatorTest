//
//  MainScreenView.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//


import UIKit
import SnapKit

class MainScreenView: UIView {
    
    var selectedAnimal: AnimalType = .dog {
           didSet {
               petUIImageView.image = UIImage(named: selectedAnimal.imageName)
           }
       }
    var translationMode: TranslationMode = .humanToPet {
           didSet {
               updateTranslationLabels()
           }
       }

    // MARK: - UI Elements
    let voiceButton = VoiceButton()

   
  
    let translationLabelLeft: UILabel = {
        let label = UILabel()
        label.text = "HUMAN"
        label.font = .Konkhmer.Regular.size(of: 16)
        label.textAlignment = .center
        return label
    }()
  
    let translationLabelRight: UILabel = {
        let label = UILabel()
        label.text = "PET"
        label.font = .Konkhmer.Regular.size(of: 16)
        label.textAlignment = .center
        return label
    }()
     
    let swapButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "swap"), for: .normal)
        return button
    }()
    
    let petUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dog")
        return imageView
    }()
    
    let petView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    
    
     
    public var catButton: PetButton = {
        let button = PetButton()
        button.backgroundColor = AppColors.catButtonColor
        button.petIcon.image = UIImage(named: "cat")
        return button
    }()
    
    public var dogButton: PetButton = {
        let button = PetButton()
        button.backgroundColor = AppColors.dogButtonColor
        button.petIcon.image = UIImage(named: "dog")
        return button
    }()
    
   
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupUI()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI
    private func setupUI() {
        backgroundColor = UIColor.systemBackground
        
       
       
        addSubview(swapButton)
        addSubview(translationLabelLeft)
        addSubview(translationLabelRight)
        addSubview(voiceButton)
        addSubview(petUIImageView)
        addSubview(petView)
        addSubview(catButton)
        addSubview(dogButton)

        setupConstraints()
    }

    // MARK: - Constraints
    private func setupConstraints() {
       
        
        swapButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(140)
        }
            
        translationLabelLeft.snp.makeConstraints { make in
            make.centerY.equalTo(swapButton)
            make.right.equalTo(swapButton.snp.left).offset(-48)
        }
        
        translationLabelRight.snp.makeConstraints { make in
            make.centerY.equalTo(swapButton)
            make.left.equalTo(swapButton.snp.right).offset(48)
        }
      
        voiceButton.snp.makeConstraints { make in
            make.width.equalTo(178)
            make.height.equalTo(176)
            make.left.equalToSuperview().offset(35)
            make.top.equalTo(swapButton.snp.bottom).offset(80)
        }
       
        petUIImageView.snp.makeConstraints { make in
            make.top.equalTo(voiceButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(184)
        }

        
       
        
        petView.snp.makeConstraints { make in
            make.centerY.equalTo(voiceButton)
            make.left.equalTo(voiceButton.snp.right).offset(35)
            make.width.equalTo(107)
            make.height.equalTo(176)
        }
        
        catButton.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.centerX.equalTo(petView)
            make.top.equalTo(petView).inset(12)
        }
        
        dogButton.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.centerX.equalTo(petView)
            make.top.equalTo(catButton.snp.bottom).offset(12)


        }
    }
    
    private func updateTranslationLabels() {
           let texts = translationMode.text
           translationLabelLeft.text = texts.left
           translationLabelRight.text = texts.right
       }
}
