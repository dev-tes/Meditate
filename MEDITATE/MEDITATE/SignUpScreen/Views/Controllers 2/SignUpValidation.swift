//
//  SignUpValidation.swift
//  MEDITATE
//
//  Created by Decagon on 03/10/2021.
//

import UIKit
// MARK: ... PASSWORD VALIDATION FUNCTIONS
extension SignUpPasswordViewController {
  func validateSixCharacters() {
    let text = passwordTextField.text
    if (text!.count > 5) == true {
      sixCharacterField.textColor = ValidationColor.validPassword.color
      sixCharacterField.layer.borderColor = ValidationColor.validPassword.color.cgColor
    } else {
      sixCharacterField.textColor = ValidationColor.invalidPassword.color
      sixCharacterField.layer.borderColor = ValidationColor.invalidPassword.color.cgColor
    }
  }
  func validateUppercaseLetter() {
    let text = passwordTextField.text
    let capitalLetterRegEx  = ".*[A-Z]+.*"
    let textTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
    let upperCaseResult = textTest.evaluate(with: text)
    if upperCaseResult {
      oneUppercaseLetterField.textColor = ValidationColor.validPassword.color
      oneUppercaseLetterField.layer.borderColor = ValidationColor.validPassword.color.cgColor
    } else {
      oneUppercaseLetterField.textColor = ValidationColor.invalidPassword.color
      oneUppercaseLetterField.layer.borderColor = ValidationColor.invalidPassword.color.cgColor
    }
  }
  func validateNumber() {
    let text = passwordTextField.text
    let numberRegEx  = ".*[0-9]+.*"
    let textTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
    let numberResult = textTest.evaluate(with: text)
    if numberResult == true {
      oneNumberField.textColor = ValidationColor.validPassword.color
      oneNumberField.layer.borderColor = ValidationColor.validPassword.color.cgColor
    } else {
      oneNumberField.textColor = ValidationColor.invalidPassword.color
      oneNumberField.layer.borderColor = ValidationColor.invalidEmail.color.cgColor
    }
  }
  func validateSpecialCharacter() {
    let text = passwordTextField.text
    let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
    let textTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
    let specialCharacterResult = textTest.evaluate(with: text)
    if specialCharacterResult == true {
      oneSpecialCharacterField.textColor = ValidationColor.validPassword.color
      oneSpecialCharacterField.layer.borderColor = ValidationColor.validPassword.color.cgColor
    } else {
      oneSpecialCharacterField.textColor = ValidationColor.invalidPassword.color
      oneSpecialCharacterField.layer.borderColor = ValidationColor.invalidPassword.color.cgColor
    }
  }
  func validateAllOtherFields() {
    if sixCharacterField.textColor == ValidationColor.validPassword.color &&
        oneUppercaseLetterField.textColor == ValidationColor.validPassword.color &&
        oneNumberField.textColor == ValidationColor.validPassword.color &&
        oneSpecialCharacterField.textColor == ValidationColor.validPassword.color {
      passwordTextField.layer.borderColor = ValidationColor.validPassword.color.cgColor
      passwordConfirmationLabel.text = "Strong password"
      passwordConfirmationLabel.textColor = ValidationColor.validPassword.color
      passwordBarStrength.tintColor = ValidationColor.validPassword.color
    } else {
      passwordTextField.layer.borderColor = ValidationColor.invalidPassword.color.cgColor
      passwordConfirmationLabel.text = "Weak password"
      passwordConfirmationLabel.textColor = ValidationColor.invalidPassword.color
      passwordBarStrength.tintColor = ValidationColor.invalidPassword.color
    }
  }
      func toValidatePasswordStrengthBar() {
          guard let text = passwordTextField.text else { return }
          var strength: Float = 0.00
          if sixCharacterField.textColor == ValidationColor.validPassword.color {
              strength += 0.20
          }
          if oneUppercaseLetterField.textColor == ValidationColor.validPassword.color {
              strength += 0.20
          }
          if oneNumberField.textColor == ValidationColor.validPassword.color {
              strength += 0.20
          }
          if oneSpecialCharacterField.textColor == ValidationColor.validPassword.color {
              strength += 0.20
          }
          if strength >= 0.80 && text.count >= 9 {
              strength = 1.000
          }
        passwordBarStrength.setProgress(strength, animated: true)
          if strength >= 0.80 {
            passwordBarStrength.tintColor = ValidationColor.validPassword.color
            createAccountButton.isEnabled = true
            createAccountButton.backgroundColor = ValidationColor.activeButton.color
          } else {
            passwordBarStrength.tintColor = ValidationColor.invalidPassword.color
            createAccountButton.isEnabled = false
            createAccountButton.backgroundColor = ValidationColor.disableButton.color
          }
      }
}
