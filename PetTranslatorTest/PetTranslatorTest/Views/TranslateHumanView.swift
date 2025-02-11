//
//  TranslateHumanView.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 10.02.2025.
//

import Foundation
import UIKit
import SnapKit
import AVFoundation

class TranslateHumanView: UIView {
    
    // MARK: - UI Elements
    private let gradientView = GradientView()
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
    private var audioPlayer: AVAudioPlayer?
    private let soundName: String
    
    // MARK: - Init
    init(animal: AnimalType, soundName: String) {
        self.soundName = soundName
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
        
        repeatButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(291)
            make.height.equalTo(54)
        }
    }
    
    // MARK: - Animations & Sound
    private func animate() {
        titleLabel.alpha = 0
        repeatButton.alpha = 0

        UIView.animate(withDuration: 0.5, animations: {
            self.titleLabel.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 5, options: [], animations: {
                self.titleLabel.alpha = 0
            }) { _ in
                self.playSound()
            }
        }
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Sound file not found: \(soundName)" )
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + (audioPlayer?.duration ?? 5.0)) {
                self.repeatButton.alpha = 1
            }
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
