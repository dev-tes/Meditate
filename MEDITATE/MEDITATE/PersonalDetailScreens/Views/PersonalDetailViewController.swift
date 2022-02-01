//
//  PersonalDetailViewController.swift
//  MEDITATE
//
//  Created by Decagon on 12/10/2021.
//

import UIKit

class PersonalDetailViewController: UIViewController {
  // MARK: PROPERTIES
  let personalDetailTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Personal Details"
    label.font = UIFont(name: "NunitoSans-Bold", size: 22)
    label.frame = CGRect(x: 0, y: 0, width: 183, height: 29)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
  return label
  }()
  let personalDetailBackButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapPersonalDetailBackButton), for: .touchUpInside)
    button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  let fullNameView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let fullNameIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "ProfileIconBlack")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  let fullNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Full Name"
    label.frame = CGRect(x: 0, y: 0, width: 81, height: 23)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "NunitoSans-Bold", size: 17)
    return label
  }()
  let fullNameButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapFullNameButton), for: .touchUpInside)
    button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  let emailView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let emailIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "Large")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  let emailLabel: UILabel = {
    let label = UILabel()
    label.text = "Email"
    label.frame = CGRect(x: 0, y: 0, width: 81, height: 23)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "NunitoSans-Bold", size: 17)
    return label
  }()
  let emailButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapEmailButton), for: .touchUpInside)
    button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  let passwordView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let passwordIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "passwordIcon")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  let passwordLabel: UILabel = {
    let label = UILabel()
    label.text = "Password"
    label.frame = CGRect(x: 0, y: 0, width: 81, height: 23)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "NunitoSans-Bold", size: 17)
    return label
  }()
  let passwordButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapPasswordButton), for: .touchUpInside)
    button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
    override func viewDidLoad() {
    super.viewDidLoad()
      navigationController?.setNavigationBarHidden(true, animated: false)
      view.backgroundColor = .white
      addPersonalDetailSubViews()
      layoutPersonalDetailTitle()
      layoutFullNameViews()
      layoutEmailViews()
      layoutPasswordViews()
  }
  // MARK: SUBVIEWS LAYOUT
  func addPersonalDetailSubViews() {
    view.addSubview(personalDetailTitleLabel)
    view.addSubview(personalDetailBackButton)
    view.addSubview(fullNameView)
    fullNameView.addSubview(fullNameIcon)
    fullNameView.addSubview(fullNameLabel)
    fullNameView.addSubview(fullNameButton)
    view.addSubview(emailView)
    emailView.addSubview(emailIcon)
    emailView.addSubview(emailLabel)
    emailView.addSubview(emailButton)
    view.addSubview(passwordView)
    passwordView.addSubview(passwordIcon)
    passwordView.addSubview(passwordLabel)
    passwordView.addSubview(passwordButton)
      }
  func layoutPersonalDetailTitle() {
    NSLayoutConstraint.activate([
      // personalDetailTitleLabel Constraints
      personalDetailTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      personalDetailTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // personalDetailBackButton Constraints
      personalDetailBackButton.topAnchor.constraint(equalTo: personalDetailTitleLabel.topAnchor),
      personalDetailBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
      ])
  }
  func layoutFullNameViews() {
    NSLayoutConstraint.activate([
      // fullNameView Constraints
      fullNameView.heightAnchor.constraint(equalToConstant: 50),
      fullNameView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84),
      fullNameView.topAnchor.constraint(equalTo: personalDetailTitleLabel.bottomAnchor, constant: 30),
      fullNameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // fullNameIcon Constraints
      fullNameIcon.leadingAnchor.constraint(equalTo: fullNameView.leadingAnchor),
      fullNameIcon.centerYAnchor.constraint(equalTo: fullNameView.centerYAnchor),
      fullNameIcon.heightAnchor.constraint(equalToConstant: 48),
      fullNameIcon.widthAnchor.constraint(equalToConstant: 48),
      // fullNameLabel Constraints
      fullNameLabel.leadingAnchor.constraint(equalTo: fullNameIcon.trailingAnchor, constant: 25),
      fullNameLabel.centerYAnchor.constraint(equalTo: fullNameView.centerYAnchor),
      // fullNameButton Constraints
      fullNameButton.trailingAnchor.constraint(equalTo: fullNameView.trailingAnchor),
      fullNameButton.centerYAnchor.constraint(equalTo: fullNameView.centerYAnchor)
    ])
}
  func layoutEmailViews() {
    NSLayoutConstraint.activate([
      // emailView Constraints
      emailView.heightAnchor.constraint(equalToConstant: 50),
      emailView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84),
      emailView.topAnchor.constraint(equalTo: fullNameView.bottomAnchor, constant: 30),
      emailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // emailIcon Constraints
      emailIcon.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
      emailIcon.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
      emailIcon.heightAnchor.constraint(equalToConstant: 48),
      emailIcon.widthAnchor.constraint(equalToConstant: 48),
      // emailLabel Constraints
      emailLabel.leadingAnchor.constraint(equalTo: emailIcon.trailingAnchor, constant: 25),
      emailLabel.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
      // emailButton Constraint
      emailButton.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
      emailButton.centerYAnchor.constraint(equalTo: emailView.centerYAnchor)
    ])
}
  func layoutPasswordViews() {
    NSLayoutConstraint.activate([
      // passwordView Constraints
      passwordView.heightAnchor.constraint(equalToConstant: 50),
      passwordView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.84),
      passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 30),
      passwordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // passwordIcon Constraints
      passwordIcon.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
      passwordIcon.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
      passwordIcon.heightAnchor.constraint(equalToConstant: 48),
      passwordIcon.widthAnchor.constraint(equalToConstant: 48),
      // passwordLabel Constraints
      passwordLabel.leadingAnchor.constraint(equalTo: passwordIcon.trailingAnchor, constant: 25),
      passwordLabel.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
      // passwordButton Constraint
      passwordButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
      passwordButton.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor)
    ])
  }
  @objc func didTapPersonalDetailBackButton() {
    navigationController?.popViewController(animated: true)
  }
  @objc func didTapFullNameButton() {
    navigationController?.pushViewController(UpdateNameViewController(), animated: true)
  }
  @objc func didTapEmailButton() {
    navigationController?.pushViewController(EmailUpdateViewController(), animated: true)
  }
  @objc func didTapPasswordButton() {
    navigationController?.pushViewController(CurrentPasswordViewController(), animated: true)
  }
}
