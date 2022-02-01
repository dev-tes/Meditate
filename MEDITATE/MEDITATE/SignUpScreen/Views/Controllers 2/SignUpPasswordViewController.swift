//
//  SignUpPasswordViewController.swift
//  MEDITATE
//
//  Created by Decagon on 25/09/2021.
//

import UIKit
import FirebaseAuth

class SignUpPasswordViewController: UIViewController {
    var email: String = ""
    // navigation bar view
    private let navigationView: UIView = {
        let navView = UIView()
        //    Back button configuration
        let backButton: UIButton = {
            let backButtonImageView: UIImageView = {
                let backButtonImage = UIImageView()
                backButtonImage.translatesAutoresizingMaskIntoConstraints = false
                backButtonImage.image = UIImage(named: "Icon")
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
            textLabel.text = "Please create a \n password"
            return textLabel
        }()
        navView.addSubview(backButton)
        navView.addSubview(navigationTextLabel)
        navigationTextLabel.topAnchor.constraint(equalTo: navView.topAnchor, constant: 59).isActive = true
        navigationTextLabel.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive =  true
        backButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -20).isActive = true
        backButton.rightAnchor.constraint(equalTo: navigationTextLabel.leftAnchor, constant: -45).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 117).isActive = true
        navView.translatesAutoresizingMaskIntoConstraints = false
        return navView
    }()
    //  password text label
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "NunitoSans-Regular", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //  password focus button
    let passwordFocusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.setImage(UIImage(named: "Focus Icon"), for: .normal)
        button.addTarget(self, action: #selector(toMakePasswordVisible), for: .touchUpInside)
        return button
    }()
    //  Password text-field
    let passwordTextField: UITextField = {
        let passwordText = UITextField.makeTextField()
        passwordText.setPadding(left: 25, right: 0)
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.isSecureTextEntry = true
        passwordText.addTarget(self, action: #selector(didValidatePassword), for: .editingChanged)
        return passwordText
    }()
    // password confirmation description
    let passwordConfirmationLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "NunitoSans-Regular", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // createAccount button
    let createAccountButton: UIButton = {
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
        button.setTitle("Create Account", for: .normal)
        button.addSubview(buttonImage)
        button.isEnabled = false
        button.titleLabel?.font = UIFont(name: "NunitoSans-SemiBold", size: 17)
        buttonImage.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        buttonImage.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -20).isActive = true
        button.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        return button
    }()
    // MARK: Password validation signifiers
    let passwordBarStrength: UIProgressView = {
        let progress = UIProgressView()
        progress.trackTintColor = .gray
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.heightAnchor.constraint(equalToConstant: 2).isActive = true
        return progress
    }()
    let sixCharacterField: UITextField = {
        let field = UITextField.toMakeValidationField()
        field.font = UIFont(name: "NunitoSans-Regular", size: 13)
        field.text = "6 characters"
        return field
    }()
    let oneSpecialCharacterField: UITextField = {
        let field = UITextField.toMakeValidationField()
        field.font = UIFont(name: "NunitoSans-Regular", size: 13)
        field.text = "1 Special character"
        return field
    }()
    let oneUppercaseLetterField: UITextField = {
        let field = UITextField.toMakeValidationField()
        field.font = UIFont(name: "NunitoSans-Regular", size: 13)
        field.text = "1 Uppercase letter"
        return field
    }()
    let oneNumberField: UITextField = {
        let field = UITextField.toMakeValidationField()
        field.font = UIFont(name: "NunitoSans-Regular", size: 13)
        field.text = "1 Number"
        return field
    }()
    let accountCreateFailedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .systemRed
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        doBasicSetUp()
        toConstraintTheView()
        view.backgroundColor = .white
        print(email)
    }
    @objc func didValidatePassword(_ textField: UITextField) {
        DispatchQueue.main.async {
            self.validateSixCharacters()
            self.validateUppercaseLetter()
            self.validateNumber()
            self.validateSpecialCharacter()
            self.validateAllOtherFields()
            self.toValidatePasswordStrengthBar()
        }
    }
    // MARK: Function to set up the view
    func doBasicSetUp() {
        view.addSubview(navigationView)
        view.addSubview(createAccountButton)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordConfirmationLabel)
        view.addSubview(passwordFocusButton)
        view.addSubview(sixCharacterField)
        view.addSubview(oneSpecialCharacterField)
        view.addSubview(oneNumberField)
        view.addSubview(oneUppercaseLetterField)
        view.addSubview(passwordBarStrength)
        //  Stack view for the password validations signifiers
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
        view.addSubview(accountCreateFailedLabel)
    }
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
        //    PAGE VIEW CONSTRAINT
        NSLayoutConstraint.activate([
            // password strenght bar indicator constraint
            passwordBarStrength.topAnchor.constraint(equalTo: passwordConfirmationLabel.bottomAnchor, constant: 4),
            passwordBarStrength.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            passwordBarStrength.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            // first stack view constraint
            firstStackView.topAnchor.constraint(equalTo: passwordBarStrength.bottomAnchor, constant: 25),
            firstStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            firstStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 15),
            secondStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            secondStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            //  navigation view constraint
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            navigationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            navigationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            //  Password label constraint
            passwordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            passwordLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -8),
            //  password confirmation label
            passwordConfirmationLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            passwordConfirmationLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            passwordConfirmationLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            //  password text field constriant
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            passwordFocusButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            passwordFocusButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -20),
            //  create account constraint
            createAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            createAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            createAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            accountCreateFailedLabel.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -20),
            accountCreateFailedLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    // MARK: Function to go to the next screen
    @objc  func didTapCreateAccountButton() {
        //    if there email does not exist in the database, it segues to the login screen. Else an alert is displayed that username or password already exists.
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: passwordTextField.text!, completion: { [self] result, error in
            guard error == nil else {
                accountCreateFailedLabel.text = "Account Creation failed!, \n try another email"
                return
            }
            let emailLoginInViewController = EmailLoginViewController()
//            if the signup is successful, an alert is shown on the Login page that sign up was successful and user can now sign in
            emailLoginInViewController.accountcreatedLabel.text = "Account successfully created \n Please Login"
//            after you log in, the email text field in the login page is automatically filled with the email used to create the account.
            emailLoginInViewController.emailTextField.text = email
            self.navigationController?.pushViewController(emailLoginInViewController, animated: true)
        })
        // navigate to the next screen
    }
    // MARK: Function to control password focus
    @objc func toMakePasswordVisible(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = false
            passwordFocusButton.setImage(UIImage(named: "Focus Icon2"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordFocusButton.setImage(UIImage(named: "Focus Icon"), for: .normal)
        }
    }
    // MARK: Function to go back to the previous page
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
