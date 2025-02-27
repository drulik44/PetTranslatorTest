//
//  TranslatorViewController.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//

import UIKit
import SnapKit
import AVFoundation

class TranslatorViewController: UIViewController {
    // MARK: - UI Elements
    private let mainView = MainScreenView()
    private let gradientView = GradientView()
    private var isRecording = false

    private var selectedAnimal: AnimalType = .dog
    private var translationMode: TranslationMode = .humanToPet

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let tittleLabel: UILabel = {
            let label = UILabel()
            label.text = "Translator"
            label.font = .Konkhmer.Regular.size(of: 32)
            label.textColor = AppColors.main
            return label
        }()
        navigationItem.titleView = tittleLabel
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupActions()
    }

    // MARK: - UI Setup
    private func setupUI() {
        mainView.backgroundColor = .clear

        view.addSubview(gradientView)
        view.addSubview(mainView)

        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.layoutIfNeeded()
        view.sendSubviewToBack(gradientView)
    }

    // MARK: - Actions
    private func setupActions() {
        mainView.dogButton.addTarget(self, action: #selector(selectDog), for: .touchUpInside)
        mainView.catButton.addTarget(self, action: #selector(selectCat), for: .touchUpInside)
        mainView.voiceButton.addTarget(self, action: #selector(startRecording), for: .touchUpInside)
        mainView.swapButton.addTarget(self, action: #selector(switchTranslationMode), for: .touchUpInside)
    }

    // MARK: - Select Animal
    @objc private func selectDog() {
            updateSelectedAnimal(.dog)
        }

        @objc private func selectCat() {
            updateSelectedAnimal(.cat)
        }

   
    // MARK: - Update Selected Animal
    private func updateSelectedAnimal(_ animal: AnimalType) {
        self.selectedAnimal = animal
        mainView.updatePetSelection(selectedAnimal: animal)
        mainView.updatePetImage(with: animal.imageName)
    }


    // MARK: - Voice Button Appearance
    private func updateVoiceButtonAppearance(isRecording: Bool) {
        let voiceButton = mainView.voiceButton

        if isRecording {
            voiceButton.micIcon.isHidden = true
            voiceButton.animationView.isHidden = false
            voiceButton.animationView.play()
            voiceButton.label.text = "Recording..."
        } else {
            voiceButton.animationView.stop()
            voiceButton.animationView.isHidden = true
            voiceButton.micIcon.isHidden = false
            voiceButton.label.text = "Start Speak"
        }
    }

    // MARK: - Start Recording
    @objc private func startRecording() {
        requestMicrophonePermission { granted in
            if granted {
                self.toggleRecording()
            } else {
                self.showPermissionAlert()
            }
        }
    }

    private func toggleRecording() {
        isRecording.toggle()
        updateVoiceButtonAppearance(isRecording: isRecording)

        if isRecording {
            print("Запись началась")
        } else {
            checkAndNavigate()
        }
    }

    // MARK: - Switch Translation Mode
    @objc private func switchTranslationMode() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.mainView.swapButton.transform = self.mainView.swapButton.transform.rotated(by: .pi)
        })
        
        self.translationMode = self.translationMode == .humanToPet ? .petToHuman : .humanToPet
        
        let texts = self.translationMode.text
        mainView.updateTranslationLabels(leftText: texts.left, rightText: texts.right)
    }


    // MARK: - Show Permission Alert
    private func showPermissionAlert() {
        let alert = UIAlertController(
            title: "Enable Microphone Access",
            message: "Please allow access to your microphone to use the app’s features",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Settings", style: .default) { _ in
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(settingsURL)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }

    // MARK: - Request Microphone Permission
    private func requestMicrophonePermission(completion: @escaping (Bool) -> Void) {
        let permissionStatus = AVAudioSession.sharedInstance().recordPermission
        if #available(iOS 17.0, *) {
            switch permissionStatus {
            case .granted:
                completion(true)
            case .denied:
                completion(false)
            case .undetermined:
                AVAudioSession.sharedInstance().requestRecordPermission { granted in
                    DispatchQueue.main.async {
                        completion(granted)
                    }
                }
            @unknown default:
                completion(false)
            }
        } else {
            switch AVAudioSession.sharedInstance().recordPermission {
            case .granted:
                completion(true)
            case .denied:
                completion(false)
            case .undetermined:
                AVAudioSession.sharedInstance().requestRecordPermission { granted in
                    DispatchQueue.main.async {
                        completion(granted)
                    }
                }
            @unknown default:
                completion(false)
            }
        }
    }

    // MARK: - Navigate to Result
    private func navigateToPetResult() {
        let animalPhrases = AnimalPhrases()
        let speechText = animalPhrases.getPhrase(for: self.selectedAnimal)
        let resultVC = PetResultViewController(
            animal: self.selectedAnimal,
            translationMode: self.translationMode,
            speechText: speechText
        )
        navigationController?.pushViewController(resultVC, animated: true)
    }

    private func navigateToHumanResult() {
        let animalPhrases = AnimalPhrases()
        let animalSound = animalPhrases.getSound(for: self.selectedAnimal)

        let soundVC = HumanResultViewController(
            animal: self.selectedAnimal,
            animalSound: animalSound
        )
        navigationController?.pushViewController(soundVC, animated: true)
    }

    private func checkAndNavigate() {
        if self.translationMode == .petToHuman {
            navigateToPetResult()
        } else if self.translationMode == .humanToPet {
            navigateToHumanResult()
        }
    }
}
