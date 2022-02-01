//
//  PrivacyPolicyViewController.swift
//  MEDITATE
//
//  Created by User on 11/10/2021.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {
    var acceptButton: UIButton = {
        let button = UIButton.makeBlackRoundedButton()
        button.setTitle("Accept", for: .normal)
        button.addTarget(self, action: #selector(didTapAcceptButton), for: .touchUpInside)
        button.layer.borderWidth = 0
        return button
    }()
    var declineButton: UIButton = {
        let button = UIButton.makeWhiteRoundedButton()
        button.setTitle("Decline", for: .normal)
        button.titleLabel?.text = "Decline"
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapDeclineButton), for: .touchUpInside)
        return button
    }()
    private let privacyBackButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    let privacyInformationImageView: UIImageView = {
        let infoImage = UIImageView()
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        infoImage.image = UIImage(named: "Text Content")
        infoImage.contentMode = .scaleAspectFit
        return infoImage
    }()
  let privacyTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Privacy Policy"
    label.font = UIFont(name: "NunitoSans-Bold", size: 22)
    label.frame = CGRect(x: 0, y: 0, width: 183, height: 29)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
  return label
  }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupViewConstraints()
      layoutPrivacyTitle()
    }
    func addSubviews() {
        view.addSubview(acceptButton)
        view.addSubview(privacyBackButton)
        view.addSubview(privacyTitleLabel)
        view.addSubview(declineButton)
        view.addSubview(privacyInformationImageView)
    }
  func layoutPrivacyTitle() {
    NSLayoutConstraint.activate([
      // personalDetailTitleLabel Constraints
      privacyTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      privacyTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // personalDetailBackButton Constraints
      privacyBackButton.topAnchor.constraint(equalTo: privacyTitleLabel.topAnchor),
      privacyBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
      ])
  }
    // MARK: - Setup constraints for view items
    func setupViewConstraints() {
        NSLayoutConstraint.activate([
            acceptButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            acceptButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            acceptButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            acceptButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            declineButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            declineButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            declineButton.bottomAnchor.constraint(equalTo: acceptButton.topAnchor, constant: -15),
            privacyInformationImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            privacyInformationImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            privacyInformationImageView.bottomAnchor.constraint(equalTo: declineButton.topAnchor, constant: -104),
            privacyInformationImageView.topAnchor.constraint(equalTo: privacyTitleLabel.bottomAnchor, constant: 30)
        ])
    }
    // MARK: BACK BUTTON
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    @objc func didTapAcceptButton() {
//        let viewController = HomeTabBarController()
//        navigationController?.pushViewController(viewController, animated: true)
      }
    @objc func didTapDeclineButton() {
//        let viewController = HomeTabBarController()
//        navigationController?.pushViewController(viewController, animated: true)
      }
}
