//
//  SettingsCell.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 10.02.2025.
//


import UIKit
import SnapKit

class SettingsCell: UITableViewCell {

    static let identifier = "SettingsCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .Konkhmer.Regular.size(of: 16)
        label.textColor = AppColors.main
        return label
    }()

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = AppColors.speechBubbleColor
        layer.cornerRadius = 15
        clipsToBounds = true

        addSubview(titleLabel)
        addSubview(arrowImageView)

        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        arrowImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }

    func configure(with option: SettingsOption) {
        titleLabel.text = option.title
        arrowImageView.image = option.icon
    }
}
