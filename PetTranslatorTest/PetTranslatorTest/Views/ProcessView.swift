//
//  ProcessView.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 09.02.2025.
//

import UIKit
import SnapKit

class ProcessView: UIView {
    
    // MARK: - UI Elements
    private let gradientView = GradientView()
    private let speechBubbleView: SpeechBubbleView
    private let animalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .Konkhmer.Regular.size(of: 16)
        label.textColor = AppColors.main
        label.text = "Process of translation..."
        label.textAlignment = .center
        return label
    }()
    
     let repeatButton = RepeatButton()
    
    
    // MARK: - Init
    init(animal: AnimalType, speechText: String) {
        self.speechBubbleView = SpeechBubbleView(text: speechText)
        super.init(frame: .zero)
        animalImageView.image = UIImage(named: animal.imageName)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        addSubview(gradientView)
        addSubview(animalImageView)
        addSubview(titleLabel)
        addSubview(speechBubbleView)
        addSubview(repeatButton)

        setupConstraints()
        animate()
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        animalImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide).inset(106)
            make.width.height.equalTo(184)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(animalImageView.snp.top).offset(-65)
        }
        
        speechBubbleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-20)
            make.width.equalTo(291)
            make.height.equalTo(142)
        }
        
        repeatButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(291)
            make.height.equalTo(54)
        }
    }
    
    // MARK: - Animations
    private func animate() {
        titleLabel.alpha = 0
        speechBubbleView.alpha = 0
        repeatButton.alpha = 0

        UIView.animate(withDuration: 0.5, animations: {
            self.titleLabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 5, options: [], animations: {
                self.titleLabel.alpha = 0
            }) { _ in
                self.animateSpeechBubble()
            }
        }
    }

    private func animateSpeechBubble() {
        UIView.animate(withDuration: 0.5, animations: {
            self.speechBubbleView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 5, animations: {
                self.speechBubbleView.alpha = 0
                self.repeatButton.alpha = 1
            })
        }
    }
}
