//
//  FocusMasterViewController.swift
//  MEDITATE
//
//  Created by  Decagon on 04/10/2021.
//

import UIKit

class FocusViewController: UIViewController {
    // MARK: PROPERTIES
    let topBackArrowButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Go Back Icon"), for: .normal)
        return button
    }()
    let decreaseStressLevelIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "StarIcon"), for: .normal)
        return button
    }()
    let stressLabel: UILabel = {
        let label = UILabel()
        label.text = "Focus Master"
        label.font = UIFont(name: "Nunito Sans", size: 20)
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let decreaseStressLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "You have been really focused \nfor the past 30 days."
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Nunito Sans", size: 14)
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.setTitleColor(AppColors.white.color, for: .normal)
        button.layer.cornerRadius = 28
        button.backgroundColor = AppColors.black.color
        button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 17)
        button.isEnabled = true
        return button
    }()
    let shareForwardArrowButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(AppButtonImages.goForwardButton.image, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        setupConstraints()
    }
    func setupConstraints() {
        view.addSubview(decreaseStressLevelIcon)
        view.addSubview(decreaseStressLevelLabel)
        view.addSubview(shareButton)
        view.addSubview(stressLabel)
        view.addSubview(shareForwardArrowButton)
        view.addSubview(topBackArrowButton)
        NSLayoutConstraint.activate([
            topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            decreaseStressLevelIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            decreaseStressLevelIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            decreaseStressLevelIcon.heightAnchor.constraint(equalToConstant: 116),
            decreaseStressLevelIcon.widthAnchor.constraint(equalToConstant: 116),
            decreaseStressLevelLabel.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 20),
            decreaseStressLevelLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stressLabel.topAnchor.constraint(equalTo: decreaseStressLevelIcon.bottomAnchor, constant: 50),
            stressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            shareButton.heightAnchor.constraint(equalToConstant: 60),
            shareForwardArrowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -65),
            shareForwardArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    // MARK: OBJC FUNCTION
    @objc func didTapShareButton() {
        presentCustomAlertOnMainThread(title: "Share with Friends", message: "You can share all your achievements with your friends.", buttonTitle: "Share", imageNamed: "ShareIcon", arrowBtn: true)
    }
    @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
    }
}
