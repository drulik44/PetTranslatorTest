//
//  TranslatorViewController.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//

import UIKit
import SnapKit

class TranslatorViewController: UIViewController {
    private let mainView = MainScreenView()
    let gradientView = GradientView()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .clear

        gradientView.backgroundColor = .clear
        view.addSubview(gradientView)
        view.addSubview(mainView)

        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.layoutIfNeeded() // 🔥 Добавь эту строку


        view.sendSubviewToBack(gradientView) // Убедись, что градиент не перекрывается


        mainView.speakButton.addTarget(self, action: #selector(startRecording), for:.touchUpInside)
    }

    @objc func startRecording() {
        print("Запись началась")
    }
}



