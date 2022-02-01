//
//  PasswordResetViewController.swift
//  MEDITATE
//
//  Created by Decagon on 02/10/2021.
//

import UIKit
class PasswordResetViewController: UIViewController { 
    var resetPasswordButton: UIButton = {
        let button = UIButton.attributedButton()
        button.setTitle("Reset Password", for: .normal)
        button.backgroundColor = AppColors.grayedOutButton.color
        button.addTarget(self, action: #selector(didTapResetPasswordButton), for: .touchUpInside)
        button.layer.borderWidth = 0
        return button
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 25
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.setPadding(left: 20, right: 48)
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    let passwordTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    let headingTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create your new \n password"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    private let forwardButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Go-forward"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let seePasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Dark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPasswordVisibiltyClicked), for: .touchUpInside)
        return button
    }()
    lazy var passwordStrengthProgressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = .lightGray
        progressView.tintColor = .black
        progressView.setProgress(0, animated: true)
        return progressView
    }()
    // MARK: - ... Creating the Validation textfield For validation items
    lazy var sixCharacterValidationField: UITextField = {
        let textField = UITextField()
        textField.text = "   6 Characters  "
        textField.textColor = .black
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 25
        textField.font = UIFont(name: "nunito-sans", size: 7)
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    lazy var oneNumberValidationField: UITextField = {
        let  textField = UITextField()
        textField.text = "    1 Number   "
        textField.textColor = .black
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 25
        textField.font = UIFont(name: "nunito-sans", size: 7)
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return  textField
    }()
    lazy var oneSpecialCharacterValidationField: UITextField = {
        let textField = UITextField()
        textField.text = "  1 Special character   "
        textField.textColor = .black
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 25
        textField.font = UIFont(name: "nunito-sans", size: 7)
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    lazy var oneUpperCaseValidationField: UITextField = {
        let  textField = UITextField()
        textField.text = "  1 Uppercase letter"
        textField.textColor = .black
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 25
        textField.font = UIFont(name: "nunito-sans", size: 7)
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return  textField
    }()
    lazy var passwordDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupViewConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    // MARK: - ... Creating the top stackview
    lazy var uppercaseAndCharacterCountStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(sixCharacterValidationField)
        stackView.addArrangedSubview(oneUpperCaseValidationField)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
        return stackView
    }()
    lazy var numberAndSpecialCharacterStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(oneNumberValidationField)
        stackView.addArrangedSubview(oneSpecialCharacterValidationField)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
        return stackView
    }()
    // MARK: - Validating the password inputed
    func validateSixCharacters() {
        let text = passwordTextField.text
        if (text!.count > 5) == true {
            sixCharacterValidationField.textColor = AppColors.green.color
            sixCharacterValidationField.layer.borderColor = AppColors.green.color.cgColor
        } else {
            sixCharacterValidationField.textColor = AppColors.red.color
            sixCharacterValidationField.layer.borderColor = AppColors.red.color.cgColor
        }
    }
    func validateUppercaseLetter() {
        let text = passwordTextField.text
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let textTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        let upperCaseResult = textTest.evaluate(with: text)
        if upperCaseResult {
            oneUpperCaseValidationField.textColor = AppColors.green.color
            oneUpperCaseValidationField.layer.borderColor = AppColors.green.color.cgColor
        } else {
            oneUpperCaseValidationField.textColor = AppColors.red.color
            oneUpperCaseValidationField.layer.borderColor = AppColors.red.color.cgColor
        }
    }
    func validateNumber() {
        let text = passwordTextField.text
        let numberRegEx  = ".*[0-9]+.*"
        let textTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        let numberResult = textTest.evaluate(with: text)
        if numberResult == true {
            oneNumberValidationField.textColor = AppColors.green.color
            oneNumberValidationField.layer.borderColor = AppColors.green.color.cgColor
        } else {
            oneNumberValidationField.textColor = AppColors.red.color
            oneNumberValidationField.layer.borderColor = AppColors.red.color.cgColor
        }
    }
    func validateSpecialCharacter() {
        let text = passwordTextField.text
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let textTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        let specialCharacterResult = textTest.evaluate(with: text)
        if specialCharacterResult == true {
            oneSpecialCharacterValidationField.textColor = AppColors.green.color
            oneSpecialCharacterValidationField.layer.borderColor = AppColors.green.color.cgColor
        } else {
            oneSpecialCharacterValidationField.textColor = AppColors.red.color
            oneSpecialCharacterValidationField.layer.borderColor = AppColors.red.color.cgColor
        }
    }
    func validateAllOtherFields() {
        if sixCharacterValidationField.textColor == AppColors.green.color &&
            oneUpperCaseValidationField.textColor == AppColors.green.color &&
            oneNumberValidationField.textColor == AppColors.green.color &&
            oneSpecialCharacterValidationField.textColor == AppColors.green.color {
            passwordTextField.layer.borderColor = AppColors.green.color.cgColor
            passwordDescriptionLabel.text = "Strong password"
            passwordDescriptionLabel.textColor = AppColors.green.color
            passwordStrengthProgressBar.tintColor = AppColors.green.color
        } else {
            passwordTextField.layer.borderColor = AppColors.red.color.cgColor
            passwordDescriptionLabel.text = "Weak password"
            passwordDescriptionLabel.textColor = AppColors.red.color
            passwordStrengthProgressBar.tintColor = AppColors.red.color
        }
    }
    // MARK: - Validating the Password Strength Bar
    func toValidatePasswordStrengthBar() {
              guard let text = passwordTextField.text else { return }
              var strength: Float = 0.00
        if sixCharacterValidationField.textColor == AppColors.green.color {
                  strength += 0.20
              }
              if oneNumberValidationField.textColor == AppColors.green.color {
                  strength += 0.20
              }
              if oneNumberValidationField.textColor == AppColors.green.color {
                  strength += 0.20
              }
              if oneSpecialCharacterValidationField.textColor == AppColors.green.color {
                  strength += 0.20
              }
              if strength >= 0.80 && text.count >= 9 {
                  strength = 1.000
              }
            passwordStrengthProgressBar.setProgress(strength, animated: true)
              if strength >= 0.80 {
                passwordStrengthProgressBar.tintColor = AppColors.green.color
                resetPasswordButton.isEnabled = true
                resetPasswordButton.backgroundColor = .black
              } else {
                passwordStrengthProgressBar.tintColor = AppColors.red.color
                resetPasswordButton.isEnabled = false
                resetPasswordButton.backgroundColor = .gray
              }
          }
    func addSubviews() {
        view.addSubview(resetPasswordButton)
        view.addSubview(forwardButton)
        view.addSubview(passwordTextField)
        view.addSubview(seePasswordButton)
        view.addSubview(passwordTextLabel)
        view.addSubview(headingTextLabel)
        view.addSubview(backButton)
        view.addSubview(passwordStrengthProgressBar)
        view.addSubview(passwordDescriptionLabel)
        view.backgroundColor = .white
        view.addSubview(uppercaseAndCharacterCountStack)
        view.addSubview(numberAndSpecialCharacterStack)
    }
    // MARK: - Setup constraints for view items
    func setupViewConstraints() {
        NSLayoutConstraint.activate([
            resetPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetPasswordButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            resetPasswordButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            resetPasswordButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            forwardButton.centerYAnchor.constraint(equalTo: resetPasswordButton.centerYAnchor),
            forwardButton.rightAnchor.constraint(equalTo: resetPasswordButton.rightAnchor, constant: -20),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            passwordTextField.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            seePasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            seePasswordButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -20),
            passwordTextLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10),
            passwordTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            headingTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            headingTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 96),
            headingTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -96),
            headingTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 28),
            backButton.widthAnchor.constraint(equalToConstant: 28),
            passwordDescriptionLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            passwordDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordDescriptionLabel.heightAnchor.constraint(equalToConstant: 15),
            passwordStrengthProgressBar.heightAnchor.constraint(equalToConstant: 2),
            passwordStrengthProgressBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            passwordStrengthProgressBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            passwordStrengthProgressBar.topAnchor.constraint(equalTo: passwordTextLabel.bottomAnchor, constant: 90),
            uppercaseAndCharacterCountStack.topAnchor.constraint(equalTo: passwordStrengthProgressBar.bottomAnchor, constant: 30),
            uppercaseAndCharacterCountStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            uppercaseAndCharacterCountStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -49),
            uppercaseAndCharacterCountStack.heightAnchor.constraint(equalToConstant: 52),
            numberAndSpecialCharacterStack.topAnchor.constraint(equalTo: uppercaseAndCharacterCountStack.bottomAnchor, constant: 15),
            numberAndSpecialCharacterStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            numberAndSpecialCharacterStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -61),
            numberAndSpecialCharacterStack.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    // MARK: password character visibility
    @objc func buttonPasswordVisibiltyClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = false
            seePasswordButton.setImage(UIImage(named: "No-focus"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            seePasswordButton.setImage(UIImage(named: "Dark"), for: .normal)
        }
    }
    // MARK: BACK BUTTON
    @objc func backButtonPressed() {
        let viewController = PasswordLoginViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    //  Input firebase password reset button here
    @objc func didTapResetPasswordButton() {
        let viewController = HomeTabBarController()
        navigationController?.pushViewController(viewController, animated: true)
      }
    @objc func textFieldDidChange(_ textField: UITextView) {
        validateSixCharacters()
        validateSpecialCharacter()
        validateUppercaseLetter()
        validateNumber()
        validateAllOtherFields()
        toValidatePasswordStrengthBar()
    }
}
extension UIButton {
    class func attributedButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.layer.cornerRadius = 27.5
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        button.layer.borderWidth = 1
        button.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return button
    }
}
