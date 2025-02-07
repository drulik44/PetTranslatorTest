//
//  MainScreenView.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//


import UIKit
import SnapKit

class MainScreenView: UIView {

    // MARK: - UI Elements

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Translator"
        label.font = .Konkhmer.Regular.size(of: 30)
        label.textAlignment = .center
        return label
    }()

  
    let humanLabel: UILabel = {
        let label = UILabel()
        label.text = "HUMAN"
        label.font = .Konkhmer.Regular.size(of: 16)
        label.textAlignment = .center
        return label
    }()
  
    let petLabel: UILabel = {
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
     
    
    let speakButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start Speak", for: .normal)
        button.titleLabel?.font = .Konkhmer.Regular.size(of: 16)
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        button.setImage(UIImage(named: "microphone-2"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
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
        self.backgroundColor = .clear 
    }

    // MARK: - Setup UI
    private func setupUI() {
        backgroundColor = UIColor.systemBackground

        addSubview(titleLabel)
        addSubview(swapButton)
        addSubview(humanLabel)
        addSubview(petLabel)
        addSubview(speakButton)
        

        setupConstraints()
    }

    // MARK: - Constraints
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        speakButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        
        swapButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
        }
            
            humanLabel.snp.makeConstraints { make in
                make.centerY.equalTo(swapButton)
                make.right.equalTo(swapButton.snp.left).offset(-20)
            }
        
            petLabel.snp.makeConstraints { make in
                make.centerY.equalTo(swapButton)
                make.left.equalTo(swapButton.snp.right).offset(20)
            }
        
        speakButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(swapButton.snp.bottom).offset(40)
        }
       
    }
}
