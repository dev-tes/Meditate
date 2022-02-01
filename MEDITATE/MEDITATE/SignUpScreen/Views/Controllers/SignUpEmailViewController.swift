//

//  SignUpEmailController.swift
//  MEDITATE
//
//  Created by Decagon on 24/09/2021.

//

import UIKit

class SignUpEmailViewController: UIViewController {
  // navigation bar view
  private let navigationView: UIView = {
    let navView = UIView()
    //    Back button configuration
    let backButton: UIButton = {
      let backButtonImageView: UIImageView = {
        let backButtonImage = UIImageView()
        backButtonImage.translatesAutoresizingMaskIntoConstraints = false
        backButtonImage.image = UIImage(named: "Go Back Icon")
        backButtonImage.contentMode = .scaleAspectFit
        return backButtonImage
      }()
      let backButton = UIButton()
      backButton.translatesAutoresizingMaskIntoConstraints = false
      backButton.addSubview(backButtonImageView)
      backButtonImageView.frame = backButton.bounds
      backButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
      backButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
      backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
      return backButton
    }()
    //    Navigation text label configuration
    let navigationTextLabel: UILabel = {
      let textLabel = UILabel()
      textLabel.translatesAutoresizingMaskIntoConstraints = false
      textLabel.textAlignment = .center
      textLabel.numberOfLines = 2
      textLabel.font = UIFont(name: "NunitoSans-Bold", size: 22)
      textLabel.text = "Please enter your \nemail address"
      return textLabel
    }()
    navView.addSubview(backButton)
    navView.addSubview(navigationTextLabel)
    navigationTextLabel.topAnchor.constraint(equalTo: navView.topAnchor, constant: 59).isActive = true
    navigationTextLabel.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive =  true
    backButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -20).isActive = true
    backButton.rightAnchor.constraint(equalTo: navigationTextLabel.leftAnchor, constant: -38).isActive = true
    navView.heightAnchor.constraint(equalToConstant: 117).isActive = true
    navView.translatesAutoresizingMaskIntoConstraints = false
    return navView
  }()
  //  email text label
  private let emailLabel: UILabel = {
    let label = UILabel()
    label.text = "Email"
    label.font = UIFont(name: "NunitoSans-Regular", size: 15)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  //  Email text-field
  private let emailTextField: UITextField = {
    let emailText = UITextField.makeTextField()
    emailText.setPadding(left: 25, right: 0)
    emailText.placeholder = "johnsmith@gmail.com"
    emailText.translatesAutoresizingMaskIntoConstraints = false
    emailText.autocapitalizationType = .none
    emailText.addTarget(self, action: #selector(toValidateEmailText), for: .editingChanged)
    return emailText
  }()
  // Email confirmation description
  private let emailConfirmationLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = .red
    label.font = UIFont(name: "NunitoSans-Regular", size: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // continue button
  private let continueButton: UIButton = {
    let buttonImage: UIImageView = {
      let buttonImage = UIImageView()
      buttonImage.translatesAutoresizingMaskIntoConstraints = false
      buttonImage.contentMode = .scaleAspectFit
      buttonImage.heightAnchor.constraint(equalToConstant: 28).isActive = true
      buttonImage.widthAnchor.constraint(equalToConstant: 28).isActive = true
      buttonImage.image = UIImage(named: "Go-forward")
      return buttonImage
    }()
    let button = UIButton.makeBlackRoundedButton()
    button.setTitle("Continue", for: .normal)
    button.addSubview(buttonImage)
    button.isEnabled = false
    button.titleLabel?.font = UIFont(name: "NunitoSans-SemiBold", size: 17)
    buttonImage.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
    buttonImage.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -20).isActive = true
    button.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
    return button
  }()
    private let signInInsteadButton: UIButton = {
      let buttonImage: UIImageView = {
        let buttonImage = UIImageView()
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.contentMode = .scaleAspectFit
        buttonImage.heightAnchor.constraint(equalToConstant: 28).isActive = true
        buttonImage.widthAnchor.constraint(equalToConstant: 28).isActive = true
        buttonImage.image = UIImage(named: "")
        return buttonImage
      }()
      let button = UIButton.makeBlackRoundedButton()
      button.setTitle("Login instead?", for: .normal)
      button.addSubview(buttonImage)
      button.isEnabled = true
        button.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
      button.titleLabel?.font = UIFont(name: "NunitoSans-SemiBold", size: 17)
      buttonImage.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
      buttonImage.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -20).isActive = true
      button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
      return button
    }()
  //  VIEW DID LOAD FUNCTION
  override func viewDidLoad() {
    super.viewDidLoad()
    doBasicSetUp()
    view.backgroundColor = .white
  }
  //  VIEW WILL APPEAR FUNCTION
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  //  FUNCTION TO VALIDATE EMAIL TEXT
  @objc func toValidateEmailText(_ textField: UITextField) {
    DispatchQueue.main.async { [weak self] in
      self?.toValidateEmailAddress()
    }
  }
  // MARK: Function to set up the view
  func doBasicSetUp() {
    view.addSubview(navigationView)
    view.addSubview(continueButton)
    view.addSubview(emailLabel)
    view.addSubview(emailTextField)
    view.addSubview(emailConfirmationLabel)
    view.addSubview(signInInsteadButton)
    //    Page view constraints
    NSLayoutConstraint.activate([
      //  navigation view constraint
      navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
      navigationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
      navigationView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
      //  email label constraint
      emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      emailLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
      emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -8),
      //  email confirmation label
      emailConfirmationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      emailConfirmationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
      emailConfirmationLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
      //  email text field constriant
      emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
      emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      //  continueButton constraint
      continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
      continueButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      continueButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
        signInInsteadButton.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -20),
        signInInsteadButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        signInInsteadButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
    ])
  }
  // MARK: ... Function to go to the password page
  @objc func didTapContinueButton() {
    let signUpPasswordViewController = SignUpPasswordViewController()
    signUpPasswordViewController.email = emailTextField.text!
    navigationController?.pushViewController(signUpPasswordViewController, animated: true)
  }
  @objc func didTapBackButton() {
    let onBoardingViewController = OnboardingViewController()
    navigationController?.popViewController(animated: true)
  }
    @objc func didTapSignInButton() {
      let signinViewController = EmailLoginViewController()
      navigationController?.pushViewController(signinViewController, animated: true)
    }
}
// MARK: - ... An Extension of  signUpEmailViewController
extension SignUpEmailViewController {
  func toValidateEmailAddress() {
    if emailTextField.text == nil {
      self.emailConfirmationLabel.text = ""
      self.emailTextField.layer.borderColor = ValidationColor.nilEmail.color.cgColor
      self.continueButton.isEnabled = false
      self.continueButton.backgroundColor = .black
    } else {
      let emailText = emailTextField.text
      let nameText = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
      let serverText = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
      let emailRegex = nameText + "@" + serverText + "[A-Za-z]{2,8}"
      let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
      let emailResult = emailPredicate.evaluate(with: emailText)
      if emailResult == true {
        self.emailConfirmationLabel.text = "Correct email"
        self.emailConfirmationLabel.textColor = ValidationColor.validEmail.color
        self.emailTextField.layer.borderColor = ValidationColor.validEmail.color.cgColor
        self.continueButton.backgroundColor = ValidationColor.activeButton.color
        self.continueButton.isEnabled = true
      } else {
        self.emailConfirmationLabel.text = "Please enter a valid email"
        self.emailConfirmationLabel.textColor = ValidationColor.invalidEmail.color
        self.emailTextField.layer.borderColor = ValidationColor.invalidEmail.color.cgColor
        self.continueButton.isEnabled = false
        self.continueButton.backgroundColor = ValidationColor.disableButton.color
      }
    }
  }
}

// MARK: - ... Creating an extension of UIButton
extension UIButton {
  class func makeBlackRoundedButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 27.5
    button.heightAnchor.constraint(equalToConstant: 55).isActive = true
    button.layer.borderWidth = 0
    button.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
    button.titleLabel?.font = UIFont(name: "Nunito sans", size: 17)
    return button
  }
}
extension UIButton {
  class func makeWhiteRoundedButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 27.5
    button.heightAnchor.constraint(equalToConstant: 55).isActive = true
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.black.cgColor
    button.backgroundColor = .white
    button.titleLabel?.font = UIFont(name: "Nunito sans", size: 17)
    return button
  }
}

// MARK: - ... Creating an extension of textfield
extension UITextField {
  class func makeTextField() -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.layer.cornerRadius = 27.5
    textField.heightAnchor.constraint(equalToConstant: 55).isActive = true
    textField.layer.borderWidth = 1
    return textField
  }
  class func toMakeValidationField() -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.isUserInteractionEnabled = false
    textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    textField.textAlignment = .center
    textField.layer.cornerRadius = 20
    textField.font = UIFont(name: "NunitoSans-Regular", size: 13)
    textField.layer.borderWidth = 1
    return textField
  }
  func setPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
    if let left = left {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
      self.leftView = paddingView
      self.leftViewMode = .always
    }
    if let right = right {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
      self.rightView = paddingView
      self.rightViewMode = .always
    }
  }
}
