//
//  SpeechBubbleView.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 10.02.2025.
//

import UIKit
import SnapKit

class SpeechBubbleView: UIView {
    private let label: UILabel = {
        let label = UILabel()
        label.font = .Konkhmer.Regular.size(of: 12)
        label.textColor = AppColors.main
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    init(text: String) {
        super.init(frame: .zero)
        backgroundColor = AppColors.speechBubbleColor
        layer.cornerRadius = 16
        addSubview(label)
        label.text = text
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
