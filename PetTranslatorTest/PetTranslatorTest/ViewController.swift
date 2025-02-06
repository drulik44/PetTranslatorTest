//
//  ViewController.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        let helloLabel: UILabel = {
            let label = UILabel()
            label.text = "Hello, World!"
            label.font = .Konkhmer.Regular.size(of: 20)
            return label
        }()

        view.addSubview(helloLabel)

        helloLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
}
