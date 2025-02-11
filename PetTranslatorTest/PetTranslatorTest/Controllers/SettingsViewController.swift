//
//  SettingsViewController.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//
import UIKit
import SnapKit

class SettingsViewController: UIViewController {

    private let settingsOptions = SettingsOption.allCases
    private let gradientView = GradientView()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        let tittleLabel: UILabel = {
            let label = UILabel()
            label.text = "Settings"
            label.font = .Konkhmer.Regular.size(of: 32)
            label.textColor = AppColors.main
            return label
        }()
        navigationItem.titleView = tittleLabel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    private func setupUI() {
        view.addSubview(gradientView)
        view.addSubview(tableView)

        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.identifier)
    }
}

// MARK: - UITableView Delegate & DataSource
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsOptions.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as? SettingsCell else {
            return UITableViewCell()
        }
        cell.configure(with: settingsOptions[indexPath.section])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 // Высота ячейки (можно изменить)
    }


    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let spacerView = UIView()
        spacerView.backgroundColor = .clear
        return spacerView
    }

}
