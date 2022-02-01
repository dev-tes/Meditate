//
//  CurrentPasswordViewController.swift
//  MEDITATE
//
//  Created by Decagon on 13/10/2021.
//

import UIKit

class CurrentPasswordViewController: UIViewController {
  // MARK: PROPERTIES
  let currentPasswordBackButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapCurrentPasswordBackButton), for: .touchUpInside)
    button.backgroundColor = .clear
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
    return button
  }()
  let currentPasswordTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.frame = CGRect(x: 0, y: 0, width: 183, height: 58)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.text = "Enter your \n current password"
    label.font = UIFont(name: "NunitoSans-Bold", size: 22)
    label.textAlignment = .center
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    return label
  }()
  let currentPasswordLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.font = UIFont(name: "NunitoSans-Regular", size: 15)
    label.text = "Password"
    label.textAlignment = .left
    return label
  }()
  let currentPasswordTextField: UITextField = {
      let textField = UITextField()
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.addTarget(self, action: #selector(implementPasswordValidationViews(_:)), for: .editingChanged)
      textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
      textField.leftViewMode = .always
      textField.font = UIFont(name: "NunitoSans-SemiBold", size: 15)
      textField.isSecureTextEntry = true
      textField.placeholder = "Enter Password"
      textField.textAlignment = .left
      textField.layer.cornerRadius = 25.0
      textField.layer.borderWidth = 1.0
      textField.layer.borderColor = UIColor.black.cgColor
      return textField
    }()
    let hidePasswordButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(showOrHidePassword), for: .touchUpInside)
      button.setBackgroundImage(UIImage(named: "Focus Icon"), for: .normal)
      return button
    }()
  let currentPasswordValidationLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.font = UIFont(name: "NunitoSans-Regular", size: 13)
    label.textAlignment = .left
    return label
  }()
  let continuePasswordButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
    button.setTitle("Continue", for: .normal)
    button.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
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
    view.addSubview(continuePasswordButton)
    view.addSubview(currentPasswordLabel)
    view.addSubview(currentPasswordTextField)
    view.addSubview(currentPasswordValidationLabel)
    view.addSubview(currentPasswordTitleLabel)
    view.addSubview(currentPasswordBackButton)
    view.addSubview(hidePasswordButton)
  }
  // MARK: CONTRAINT SUBVIEWS
  func layoutPersonalDetailTitle() {
    NSLayoutConstraint.activate([
      // Email Update TitleLabel Constraints
      currentPasswordTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      currentPasswordTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // Email Update BackButton Constraints
      currentPasswordBackButton.topAnchor.constraint(equalTo: currentPasswordTitleLabel.topAnchor),
      currentPasswordBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
      ])
  }
  func setUpUpdateViewConstraints() {
    NSLayoutConstraint.activate([
      // Continue password button constraint
      continuePasswordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      continuePasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      continuePasswordButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      continuePasswordButton.heightAnchor.constraint(equalToConstant: 50),
      // Current password label constraint
      currentPasswordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      currentPasswordLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      currentPasswordLabel.heightAnchor.constraint(equalToConstant: 30),
      currentPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // Current password textField constraint
      currentPasswordTextField.topAnchor.constraint(equalTo: currentPasswordLabel.bottomAnchor, constant: 5),
      currentPasswordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      currentPasswordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      currentPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
      // Current password validation label contraint
      currentPasswordValidationLabel.topAnchor.constraint(equalTo: currentPasswordTextField.bottomAnchor, constant: 5),
      currentPasswordValidationLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      currentPasswordValidationLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      currentPasswordValidationLabel.heightAnchor.constraint(equalToConstant: 20),
      // Hide password button constraints
      hidePasswordButton.trailingAnchor.constraint(equalTo: currentPasswordTextField.trailingAnchor, constant: -15),
      hidePasswordButton.heightAnchor.constraint(equalTo: currentPasswordTextField.heightAnchor, multiplier: 0.5),
      hidePasswordButton.widthAnchor.constraint(equalTo: currentPasswordTextField.heightAnchor, multiplier: 0.5),
      hidePasswordButton.centerYAnchor.constraint(equalTo: currentPasswordTextField.centerYAnchor)
    ])
  }
  @objc func didTapCurrentPasswordBackButton() {
    navigationController?.popViewController(animated: true)
  }
  @objc func didTapContinueButton() {
    if currentPasswordValidationLabel.text == "Correct password" {
      navigationController?.pushViewController(CreateNewPasswordViewController(), animated: true)
    }
  }
  @objc func showOrHidePassword() {
      if currentPasswordTextField.isSecureTextEntry == true {
          hidePasswordButton.setBackgroundImage(UIImage(named: "Focus Icon2"), for: .normal)
          currentPasswordTextField.isSecureTextEntry = false
      } else {
          currentPasswordTextField.isSecureTextEntry = true
          hidePasswordButton.setBackgroundImage(UIImage(named: "Focus Icon"), for: .normal)
      }
  }
  @objc func implementPasswordValidationViews(_ textField: UITextField) {
      DispatchQueue.main.async { [weak self] in
          guard let self = self else { return }
          self.validatePassword()
      }
  }
  func validatePassword() {
      guard let passwordText = currentPasswordTextField.text else { return }
      if passwordText.isEmpty {
          currentPasswordTextField.layer.borderColor = UIColor.black.cgColor
          currentPasswordValidationLabel.text = ""
          currentPasswordValidationLabel.textColor = .black
          continuePasswordButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
      } else if validatePasswordComponents() == true {
          currentPasswordTextField.layer.borderColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1).cgColor
          currentPasswordValidationLabel.text = "Correct password"
          currentPasswordValidationLabel.textColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1)
          continuePasswordButton.backgroundColor = .black
      } else {
          currentPasswordTextField.layer.borderColor = UIColor.red.cgColor
          currentPasswordValidationLabel.text = "Incorrect password"
          currentPasswordValidationLabel.textColor = .red
          continuePasswordButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
      }
  }
  func validatePasswordComponents() -> Bool {
      guard let passwordText = currentPasswordTextField.text else { return false }
      var lengthValidation = false
      var numberValidation = false
      var specialCharValidation = false
      var uppercaseValidation = false
      var answer = false
      // At least 6 characters
      if passwordText.count >= 6 {
          lengthValidation = true
      }
      // At least one digit
      let numberRegEx  = ".*[0-9]+.*"
      let numberTextTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
      let numberResult = numberTextTest.evaluate(with: passwordText)
      if numberResult == true {
          numberValidation = true
      }
      // At least one special character
      let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
      let specCharTextTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
      let specialCharacterResult = specCharTextTest.evaluate(with: passwordText)
      if specialCharacterResult == true {
          specialCharValidation = true
      }
      // At least one capital letter
      let capitalLetterRegEx  = ".*[A-Z]+.*"
      let capitalTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
      let upperCaseResult = capitalTest.evaluate(with: passwordText)
      if upperCaseResult == true {
          uppercaseValidation = true
      }
      // Confirm password pattern is passed
      answer = lengthValidation && numberValidation  && specialCharValidation && uppercaseValidation
      return answer
  }
}
