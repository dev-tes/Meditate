//
//  SignUpValidationStyling.swift
//  MEDITATE
//
//  Created by Decagon on 26/09/2021.
//

import UIKit

enum ValidationColor {
  case validEmail
  case invalidEmail
  case invalidPassword
  case validPassword
  case nilEmail
  case disableButton
  case activeButton
//  Mark:- ... Switch color for validation
  var color: UIColor {
    switch self {
    case.validEmail:
      return UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
    case.invalidEmail:
      return UIColor(red: 0.72, green: 0.00, blue: 0.00, alpha: 1.00)
    case.invalidPassword:
      return UIColor(red: 0.72, green: 0.00, blue: 0.00, alpha: 1.00)
    case.validPassword:
      return UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
    case.nilEmail:
      return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
    case.disableButton:
      return UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1.00)
    case.activeButton:
      return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
    }
  }
}
