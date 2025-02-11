//
//  ResultViewController.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 10.02.2025.
//
import UIKit
import SnapKit


class PetResultViewController: UIViewController {

    private let processView: ProcessView
    
    private let animal: AnimalType
    private let translationMode: TranslationMode
    
    init(animal: AnimalType, translationMode: TranslationMode, speechText: String) {
        self.processView = ProcessView(animal: animal, speechText: speechText)
        self.animal = animal
        self.translationMode = translationMode
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.addSubview(processView)
        self.tabBarController?.tabBar.isHidden = true

        processView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        processView.repeatButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Navigation Bar Setup

    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Result"
        titleLabel.font = .Konkhmer.Regular.size(of: 32)
        titleLabel.textColor = AppColors.main
        navigationItem.titleView = titleLabel
        
        let backButton = CircleBackButton()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    // MARK: - Actions

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
