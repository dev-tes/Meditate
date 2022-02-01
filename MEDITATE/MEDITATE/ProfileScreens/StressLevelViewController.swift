//
//  StressLevelViewController.swift
//  MEDITATE
//
//  Created by  Decagon on 03/10/2021.
//

import UIKit

class StressLevelViewController: UIViewController {
    // MARK: PROPERTIES
      let navigationBarArrow: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Go Back Icon"), for: .normal)
        return button
      }()
      let stressLevelIcon: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setBackgroundImage(UIImage(named: "DecreaseIcon"), for: .normal)
          return button
      }()
      let stressLabel: UILabel = {
        let label = UILabel()
        label.text = "Stress Level"
        label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 25)
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
      }()
      let stressLabelDescription: UILabel = {
        let label = UILabel()
        label.text = "Your stress level has decrease \nby 45 % recently"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 17)
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
        button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 17)
        return button
      }()
      let shareForwardArrowButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
          button.setBackgroundImage(UIImage(named: "Go-forward"), for: .normal)
        return button
      }()
    // MARK: VIEW LIFECYCLE
        override func viewDidLoad() {
            super.viewDidLoad()
          view.backgroundColor = .white
            self.tabBarController?.tabBar.isHidden = true
          setupConstraints()
        }
    // MARK: CONSTRAINTS
      func setupConstraints() {
        view.addSubview(stressLevelIcon)
        view.addSubview(stressLabelDescription)
        view.addSubview(shareButton)
        view.addSubview(stressLabel)
        view.addSubview(shareForwardArrowButton)
        view.addSubview(navigationBarArrow)
        NSLayoutConstraint.activate([
          navigationBarArrow.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
          navigationBarArrow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
          stressLevelIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 330),
          stressLevelIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          stressLevelIcon.heightAnchor.constraint(equalToConstant: 116),
          stressLevelIcon.widthAnchor.constraint(equalToConstant: 116),
          stressLabelDescription.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 20),
          stressLabelDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          stressLabel.topAnchor.constraint(equalTo: stressLevelIcon.bottomAnchor, constant: 60),
          stressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
          shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
          shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
          shareButton.heightAnchor.constraint(equalToConstant: 60),
          shareForwardArrowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -65),
          shareForwardArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
      }
    // MARK: OBJC FUNCTIONS
      @objc func didTapShareButton() {
        presentCustomAlertOnMainThread(title: "Share with Friends", message: "You can share all your achievements with your friends.", buttonTitle: "Share", imageNamed: "ShareIcon", arrowBtn: true)
      }
      @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
      }
}
