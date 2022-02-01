//
//  CreateNewPasswordValidation.swift
//  MEDITATE
//
//  Created by Decagon on 13/10/2021.
//

import UIKit
// MARK: ... PASSWORD VALIDATION FUNCTIONS
extension CreateNewPasswordViewController {
  func validateSixCharacters() {
    let text = createPasswordTextField.text
    if (text!.count > 5) == true {
      sixCharacterField.textColor = ValidationColor.validPassword.color
      sixCharacterField.layer.borderColor = ValidationColor.validPassword.color.cgColor
    } else {
      sixCharacterField.textColor = ValidationColor.invalidPassword.color
      sixCharacterField.layer.borderColor = ValidationColor.invalidPassword.color.cgColor
    }
  }
  func validateUppercaseLetter() {
    let text = createPasswordTextField.text
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
    let text = createPasswordTextField.text
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
    let text = createPasswordTextField.text
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
      createPasswordTextField.layer.borderColor = ValidationColor.validPassword.color.cgColor
      createPasswordValidationLabel.text = "Strong password"
      createPasswordValidationLabel.textColor = ValidationColor.validPassword.color
      passwordBarStrength.tintColor = ValidationColor.validPassword.color
    } else {
      createPasswordTextField.layer.borderColor = ValidationColor.invalidPassword.color.cgColor
      createPasswordValidationLabel.text = "Weak password"
      createPasswordValidationLabel.textColor = ValidationColor.invalidPassword.color
      passwordBarStrength.tintColor = ValidationColor.invalidPassword.color
    }
  }
  func toValidatePasswordStrengthBar() {
    guard let text = createPasswordTextField.text else { return }
    passwordBarStrength.isHidden = false
    sixCharacterField.isHidden = false
    oneNumberField.isHidden = false
    oneUppercaseLetterField.isHidden = false
    oneSpecialCharacterField.isHidden = false
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
      updatePasswordButton.isEnabled = true
      updatePasswordButton.backgroundColor = ValidationColor.activeButton.color
    } else {
      passwordBarStrength.tintColor = ValidationColor.invalidPassword.color
      updatePasswordButton.isEnabled = false
      updatePasswordButton.backgroundColor = ValidationColor.disableButton.color
    }
  }
}
