//
//  EmailUpdateViewController.swift
//  MEDITATE
//
//  Created by Decagon on 13/10/2021.
//

import UIKit

class EmailUpdateViewController: UIViewController {
  // MARK: PROPERTIES
  let emailUpdateBackButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapEmailUpdateBackButton), for: .touchUpInside)
    button.backgroundColor = .clear
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
    return button
  }()
  let emailTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.frame = CGRect(x: 0, y: 0, width: 183, height: 58)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.text = "Update your \n email"
    label.font = UIFont(name: "NunitoSans-Bold", size: 22)
    label.textAlignment = .center
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    return label
  }()
  let emailLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.font = UIFont(name: "NunitoSans-Regular", size: 15)
    label.text = "Email"
    label.textAlignment = .left
    return label
  }()
  let emailUpdateTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
    textField.leftViewMode = .always
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    textField.font = UIFont(name: "NunitoSans-SemiBold", size: 15)
    textField.placeholder = "John Smith"
    textField.textAlignment = .left
    textField.layer.cornerRadius = 25.0
    textField.layer.borderWidth = 1.0
    textField.layer.borderColor = UIColor.black.cgColor
    return textField
  }()
  let emailUpdateValidationLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.font = UIFont(name: "NunitoSans-Regular", size: 13)
    label.textAlignment = .left
    return label
  }()
  let emailUpdateButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
    button.setTitle("Update", for: .normal)
    button.titleLabel?.font = UIFont(name: "NunitoSans-SemiBold", size: 17)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 25
    button.setImage(UIImage(named: "Go-forward"), for: .normal)
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 280, bottom: 0, right: 0)
    button.layer.masksToBounds = false
    button.clipsToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    addUpdateSubviews()
    setUpUpdateViewConstraints()
    layoutPersonalDetailTitle()
  }
  func addUpdateSubviews() {
    view.addSubview(emailUpdateButton)
    view.addSubview(emailLabel)
    view.addSubview(emailUpdateTextField)
    view.addSubview(emailUpdateValidationLabel)
    view.addSubview(emailTitleLabel)
    view.addSubview(emailUpdateBackButton)
  }
  // MARK: CONTRAINT SUBVIEWS
  func layoutPersonalDetailTitle() {
    NSLayoutConstraint.activate([
      // Email Update TitleLabel Constraints
      emailTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      emailTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // Email Update BackButton Constraints
      emailUpdateBackButton.topAnchor.constraint(equalTo: emailTitleLabel.topAnchor),
      emailUpdateBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
      ])
  }
  func setUpUpdateViewConstraints() {
    NSLayoutConstraint.activate([
      // Email Update button constraint
      emailUpdateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      emailUpdateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emailUpdateButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      emailUpdateButton.heightAnchor.constraint(equalToConstant: 50),
      // Email label constraint
      emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      emailLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      emailLabel.heightAnchor.constraint(equalToConstant: 30),
      emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // Email textField constraint
      emailUpdateTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
      emailUpdateTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      emailUpdateTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      emailUpdateTextField.heightAnchor.constraint(equalToConstant: 50),
      // Email validation label contraint
      emailUpdateValidationLabel.topAnchor.constraint(equalTo: emailUpdateTextField.bottomAnchor, constant: 5),
      emailUpdateValidationLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      emailUpdateValidationLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      emailUpdateValidationLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  @objc func didTapEmailUpdateBackButton() {
    navigationController?.popViewController(animated: true)
  }
  @objc func didUpdateEmail() {
    if emailUpdateValidationLabel.text == "Correct email" {
        presentCustomAlertOnMainThread(title: "Email Updated", message: "You have successfully updated your email", buttonTitle: "Done", imageNamed: "Large", arrowBtn: false)
    }
  }
  @objc func updateEmailValidationViews(_ textField: UITextField) {
      DispatchQueue.main.async { [weak self] in
          guard let self = self else { return }
          self.validateEmail()
      }
  }
  func validateEmail() {
      guard let emailText = emailUpdateTextField.text else { return }
      let nameText = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
      let serverText = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
      let emailRegex = nameText + "@" + serverText + "[A-Za-z]{2,8}"
      let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
      let emailResult = emailPredicate.evaluate(with: emailText)
      if emailText.isEmpty {
          emailUpdateTextField.layer.borderColor = UIColor.black.cgColor
          emailUpdateValidationLabel.text = ""
          emailUpdateButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
      } else if emailResult {
          emailUpdateTextField.layer.borderColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1).cgColor
          emailUpdateValidationLabel.text = "Correct email"
          emailUpdateValidationLabel.textColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1)
          emailUpdateButton.backgroundColor = .black
      } else {
          emailUpdateTextField.layer.borderColor = UIColor.red.cgColor
          emailUpdateValidationLabel.text = "Please enter a valid email"
          emailUpdateValidationLabel.textColor = .red
          emailUpdateButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
      }
  }
}
