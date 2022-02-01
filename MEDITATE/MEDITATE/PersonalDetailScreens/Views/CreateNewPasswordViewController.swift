//
//  CreateNewPasswordViewController.swift
//  MEDITATE
//
//  Created by Decagon on 13/10/2021.
//

import UIKit

class CreateNewPasswordViewController: UIViewController {
  // MARK: PROPERTIES
  let createPasswordBackButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapCreatePasswordBackButton), for: .touchUpInside)
    button.backgroundColor = .clear
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
    return button
  }()
  let createPasswordTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.frame = CGRect(x: 0, y: 0, width: 183, height: 58)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.text = "Create your new \n password"
    label.font = UIFont(name: "NunitoSans-Bold", size: 22)
    label.textAlignment = .center
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    return label
  }()
  let createPasswordLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.font = UIFont(name: "NunitoSans-Regular", size: 15)
    label.text = "Password"
    label.textAlignment = .left
    return label
  }()
  let createPasswordTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    //    textField.addTarget(self, action: #selector(implementPasswordValidationViews(_:)), for: .editingChanged)
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
    textField.leftViewMode = .always
    textField.font = UIFont(name: "NunitoSans-SemiBold", size: 15)
    textField.addTarget(self, action: #selector(didValidatePassword), for: .editingChanged)
    textField.isSecureTextEntry = true
    textField.placeholder = "Enter Password"
    textField.textAlignment = .left
    textField.layer.cornerRadius = 25.0
    textField.layer.borderWidth = 1.0
    textField.layer.borderColor = UIColor.black.cgColor
    return textField
  }()
  let createPasswordHideButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(showOrHidePassword), for: .touchUpInside)
    button.setBackgroundImage(UIImage(named: "Focus Icon"), for: .normal)
    return button
  }()
  let createPasswordValidationLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.font = UIFont(name: "NunitoSans-Regular", size: 13)
    label.textAlignment = .left
    return label
  }()
  let updatePasswordButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
    button.setTitle("Update Password", for: .normal)
    button.addTarget(self, action: #selector(didCreateNewPassword), for: .touchUpInside)
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
  // MARK: Password validation signifiers
  let passwordBarStrength: UIProgressView = {
    let progress = UIProgressView()
    progress.trackTintColor = .gray
    progress.isHidden = true
    progress.translatesAutoresizingMaskIntoConstraints = false
    progress.heightAnchor.constraint(equalToConstant: 2).isActive = true
    return progress
  }()
  let sixCharacterField: UITextField = {
    let field = UITextField.toMakeValidationField()
    field.isHidden = true
    field.font = UIFont(name: "NunitoSans-Regular", size: 13)
    field.text = "6 characters"
    return field
  }()
  let oneSpecialCharacterField: UITextField = {
    let field = UITextField.toMakeValidationField()
    field.isHidden = true
    field.font = UIFont(name: "NunitoSans-Regular", size: 13)
    field.text = "1 Special character"
    return field
  }()
  let oneUppercaseLetterField: UITextField = {
    let field = UITextField.toMakeValidationField()
    field.isHidden = true
    field.font = UIFont(name: "NunitoSans-Regular", size: 13)
    field.text = "1 Uppercase letter"
    return field
  }()
  let oneNumberField: UITextField = {
    let field = UITextField.toMakeValidationField()
    field.isHidden = true
    field.font = UIFont(name: "NunitoSans-Regular", size: 13)
    field.text = "1 Number"
    return field
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    addUpdateSubviews()
    setUpUpdateViewConstraints()
    layoutCreatePasswordTitle()
    toConstraintTheView()
  }
  func addUpdateSubviews() {
    view.addSubview(updatePasswordButton)
    view.addSubview(createPasswordLabel)
    view.addSubview(createPasswordTextField)
    view.addSubview(createPasswordValidationLabel)
    view.addSubview(createPasswordTitleLabel)
    view.addSubview(createPasswordBackButton)
    view.addSubview(createPasswordHideButton)
    view.addSubview(sixCharacterField)
    view.addSubview(oneSpecialCharacterField)
    view.addSubview(oneNumberField)
    view.addSubview(oneUppercaseLetterField)
    view.addSubview(passwordBarStrength)
  }
  //  Stack view for the password validations signifiers
  func toConstraintTheView() {
    let firstStackView = UIStackView(arrangedSubviews: [sixCharacterField, oneUppercaseLetterField])
    firstStackView.distribution = .fillProportionally
    firstStackView.translatesAutoresizingMaskIntoConstraints = false
    firstStackView.axis = .horizontal
    firstStackView.spacing = 15
    let secondStackView = UIStackView(arrangedSubviews: [oneNumberField, oneSpecialCharacterField])
    secondStackView.distribution = .fillProportionally
    secondStackView.axis = .horizontal
    secondStackView.translatesAutoresizingMaskIntoConstraints = false
    secondStackView.spacing = 15
    view.addSubview(firstStackView)
    view.addSubview(secondStackView)
    NSLayoutConstraint.activate([
      // password strenght bar indicator constraint
      passwordBarStrength.topAnchor.constraint(equalTo: createPasswordValidationLabel.bottomAnchor, constant: 4),
      passwordBarStrength.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      passwordBarStrength.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      // first stack view constraint
      firstStackView.topAnchor.constraint(equalTo: passwordBarStrength.bottomAnchor, constant: 25),
      firstStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      firstStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 15),
      secondStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      secondStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
    ])
  }
  // MARK: CONTRAINT SUBVIEWS
  func layoutCreatePasswordTitle() {
    NSLayoutConstraint.activate([
      // Email Update TitleLabel Constraints
      createPasswordTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      createPasswordTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // Email Update BackButton Constraints
      createPasswordBackButton.topAnchor.constraint(equalTo: createPasswordTitleLabel.topAnchor),
      createPasswordBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
    ])
  }
  func setUpUpdateViewConstraints() {
    NSLayoutConstraint.activate([
      // Continue password button constraint
      updatePasswordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      updatePasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      updatePasswordButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      updatePasswordButton.heightAnchor.constraint(equalToConstant: 50),
      // Current password label constraint
      createPasswordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      createPasswordLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      createPasswordLabel.heightAnchor.constraint(equalToConstant: 30),
      createPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // Current password textField constraint
      createPasswordTextField.topAnchor.constraint(equalTo: createPasswordLabel.bottomAnchor, constant: 5),
      createPasswordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      createPasswordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      createPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
      // Current password validation label contraint
      createPasswordValidationLabel.topAnchor.constraint(equalTo: createPasswordTextField.bottomAnchor, constant: 5),
      createPasswordValidationLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      createPasswordValidationLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      createPasswordValidationLabel.heightAnchor.constraint(equalToConstant: 20),
      // Hide password button constraints
      createPasswordHideButton.trailingAnchor.constraint(equalTo: createPasswordTextField.trailingAnchor, constant: -15),
      createPasswordHideButton.heightAnchor.constraint(equalTo: createPasswordTextField.heightAnchor, multiplier: 0.5),
      createPasswordHideButton.widthAnchor.constraint(equalTo: createPasswordTextField.heightAnchor, multiplier: 0.5),
      createPasswordHideButton.centerYAnchor.constraint(equalTo: createPasswordTextField.centerYAnchor)
    ])
  }
  @objc func didTapCreatePasswordBackButton() {
    navigationController?.popViewController(animated: true)
  }
  @objc func didCreateNewPassword() {
    if createPasswordValidationLabel.text == "Strong password" {
        presentCustomAlertOnMainThread(title: "Password Updated", message: "You have successfully updated your password", buttonTitle: "Done", imageNamed: "passwordIcon", arrowBtn: false)
    }
  }
  @objc func didValidatePassword(_ textField: UITextField) {
    guard let passwordText = createPasswordTextField.text else { return }
    if passwordText.isEmpty {
      sixCharacterField.isHidden = true
      oneNumberField.isHidden = true
      oneUppercaseLetterField.isHidden = true
      oneSpecialCharacterField.isHidden = true
      passwordBarStrength.isHidden = true
      createPasswordTextField.layer.borderColor = UIColor.black.cgColor
      createPasswordValidationLabel.text = ""
      createPasswordValidationLabel.textColor = .black
      updatePasswordButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
    } else {
      DispatchQueue.main.async {
        self.validateSixCharacters()
        self.validateUppercaseLetter()
        self.validateNumber()
        self.validateSpecialCharacter()
        self.validateAllOtherFields()
        self.toValidatePasswordStrengthBar()
      }
    }
  }
  @objc func showOrHidePassword() {
    if createPasswordTextField.isSecureTextEntry == true {
      createPasswordHideButton.setBackgroundImage(UIImage(named: "Focus Icon2"), for: .normal)
      createPasswordTextField.isSecureTextEntry = false
    } else {
      createPasswordTextField.isSecureTextEntry = true
      createPasswordHideButton.setBackgroundImage(UIImage(named: "Focus Icon"), for: .normal)
    }
  }
}
