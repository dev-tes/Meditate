//
//  PasswordLoginViewController.swift
//  MEDITATE
//
//  Created by Decagon on 26/09/2021.
//

import UIKit
import FirebaseAuth
class PasswordLoginViewController: UIViewController, CustomProtocol {
    var email: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        addSubviews()
        setUpViewConstraints()
        print(email)
    }
    // MARK: PROPERTIES
    let navigationBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(navigateToLoginScreen), for: .touchUpInside)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
        return button
    }()
    let navigationTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Please enter your\n    password"
        label.font = UIFont.monospacedSystemFont(ofSize: 19, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textAlignment = .left
        return label
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        textField.placeholder = "Enter Password"
        textField.textAlignment = .left
        textField.layer.cornerRadius = 25.0
        textField.layer.borderWidth = 1.0
        textField.addTarget(self, action: #selector(updatePasswordValidationViews(_:)), for: .editingChanged)
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
    let passwordValidationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 17, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 0
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "Go-forward"), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 280, bottom: 0, right: 0)
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(navigateToHomeScreen), for: .touchUpInside)
        return button
    }()
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(didTapShowAlertBtn), for: .touchUpInside)
        button.setTitle("Forgot Password?", for: .normal)
        button.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 17, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.isHidden = false
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let loginFailedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemRed
        return label
    }()
    // MARK: ADD SUBVIEWS
    func addSubviews() {
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(navigationBarView)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(hidePasswordButton)
        view.addSubview(passwordValidationLabel)
        view.addSubview(navigationTitleLabel)
        view.addSubview(backButton)
        view.addSubview(loginFailedLabel)
    }
    // MARK: CONTRAINT SUBVIEWS
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            forgotPasswordButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -15),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 50),
            passwordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            passwordLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30),
            passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordValidationLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            passwordValidationLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            passwordValidationLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordValidationLabel.heightAnchor.constraint(equalToConstant: 20),
            navigationBarView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBarView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            navigationTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationTitleLabel.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 10),
            backButton.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: -10),
            backButton.leadingAnchor.constraint(equalTo: navigationBarView.leadingAnchor, constant: 25),
            hidePasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -15),
            hidePasswordButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor, multiplier: 0.5),
            hidePasswordButton.widthAnchor.constraint(equalTo: passwordTextField.heightAnchor, multiplier: 0.5),
            hidePasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            loginFailedLabel.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -20),
            loginFailedLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    @objc func showOrHidePassword() {
        if passwordTextField.isSecureTextEntry == true {
            hidePasswordButton.setBackgroundImage(UIImage(named: "Focus Icon2"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
            hidePasswordButton.setBackgroundImage(UIImage(named: "Focus Icon"), for: .normal)
        }
    }
    @objc func navigateToLoginScreen() {
        navigationController?.popViewController(animated: true)
    }
    @objc func navigateToHomeScreen() {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: passwordTextField.text!, completion: {
//           if an incorrect username or password is supplied, a popup saying invalide email or password is displayed.
            [self] result, error in
            guard error == nil else {
                loginFailedLabel.text = "invalid email or password"
                return
            }
            let viewController = HomeTabBarController()
            navigationController?.pushViewController(viewController, animated: true)
        })
    }
    @objc func updatePasswordValidationViews(_ textField: UITextField) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.validatePassword()
        }
    }
    @objc func resetPassword() {
        let viewController = PasswordResetViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func didTapShowAlertBtn() {
        CustomAlertView.shared.delegate = self
        CustomAlertView.shared.showCustomAlert(title: "Reset Password", message: "We will email you a magic link to reset your password.")
    }
    func validatePassword() {
        guard let passwordText = passwordTextField.text else { return }
        if passwordText.isEmpty {
            passwordTextField.layer.borderColor = UIColor.black.cgColor
            passwordValidationLabel.text = ""
            passwordValidationLabel.textColor = .black
            loginButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        } else if validatePasswordComponents() == true {
            passwordTextField.layer.borderColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1).cgColor
            passwordValidationLabel.text = "Correct password"
            passwordValidationLabel.textColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1)
            loginButton.backgroundColor = .black
        } else {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordValidationLabel.text = "Incorrect password"
            passwordValidationLabel.textColor = .red
            loginButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        }
    }
    func validatePasswordComponents() -> Bool {
        guard let passwordText = passwordTextField.text else { return false }
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
  func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> Void)? = nil) {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                callback?(error)
            }
        }
    func didTapActionBtn(view: UIView) {
        view.removeFromSuperview()
        //    segue to next view controller
        let viewC = PasswordResetViewController()
      sendPasswordReset(withEmail: email)
        viewC.modalPresentationStyle = .fullScreen
        present(viewC, animated: true, completion: nil)
        print(view)
    }
}
