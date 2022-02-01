//
//  EmailLoginViewController.swift
//  MEDITATE
//
//  Created by Decagon on 26/09/2021.
//

import UIKit

class EmailLoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        addSubviews()
        setUpViewConstraints()
    }
    // MARK: PROPERTIES
    let navigationBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let backButton: UIButton = {
        let button = UIButton()
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
        label.text = "Please enter your\n  email address"
        label.font = UIFont.monospacedSystemFont(ofSize: 19, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textAlignment = .left
        return label
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(updateEmailValidationViews), for: .editingChanged)
        textField.isSecureTextEntry = false
        textField.placeholder = "Enter Email address"
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 25.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    let emailValidationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    let continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        button.setTitle("Continue", for: .normal)
        button.addTarget(self, action: #selector(navigateToPasswordScreen), for: .touchUpInside)
        button.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 17, weight: .regular)
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
    let accountcreatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemGreen
        return label
    }()
    // MARK: ADD SUBVIEWS
    func addSubviews() {
        view.addSubview(continueButton)
        view.addSubview(navigationBarView)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailValidationLabel)
        view.addSubview(navigationTitleLabel)
        view.addSubview(backButton)
        view.addSubview(accountcreatedLabel)
    }
    // MARK: CONTRAINT SUBVIEWS
    func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            // Continue button constraint
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            // Email label constraint
            emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            emailLabel.heightAnchor.constraint(equalToConstant: 30),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Email textField constraint
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            // Email validation label contraint
            emailValidationLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            emailValidationLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            emailValidationLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            emailValidationLabel.heightAnchor.constraint(equalToConstant: 20),
            // Navigation bar view constraint
            navigationBarView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 117),
            // Navigation title label contrait
            navigationTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationTitleLabel.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 10),
            // Back button constraint
            backButton.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: -10),
            backButton.leadingAnchor.constraint(equalTo: navigationBarView.leadingAnchor, constant: 25),
            accountcreatedLabel.topAnchor.constraint(equalTo: emailValidationLabel.bottomAnchor, constant: 10),
            accountcreatedLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            accountcreatedLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10)
        ])
    }
    // MARK: Action triggered function
    @objc func navigateToPasswordScreen() {
        if emailValidationLabel.text == "Correct email" {
            let passwordViewController = PasswordLoginViewController()
            passwordViewController.email = emailTextField.text!
            navigationController?.pushViewController(passwordViewController, animated: true)
        }
    }
    @objc func updateEmailValidationViews(_ textField: UITextField) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.validateEmail()
        }
    }
    func validateEmail() {
        guard let emailText = emailTextField.text else { return }
        let nameText = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverText = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = nameText + "@" + serverText + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let emailResult = emailPredicate.evaluate(with: emailText)
        if emailText.isEmpty {
            emailTextField.layer.borderColor = UIColor.black.cgColor
            emailValidationLabel.text = ""
            continueButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        } else if emailResult {
            emailTextField.layer.borderColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1).cgColor
            emailValidationLabel.text = "Correct email"
            emailValidationLabel.textColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1)
            continueButton.backgroundColor = .black
        } else {
            emailTextField.layer.borderColor = UIColor.red.cgColor
            emailValidationLabel.text = "Please enter a valid email"
            emailValidationLabel.textColor = .red
            continueButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        }
    }
}
