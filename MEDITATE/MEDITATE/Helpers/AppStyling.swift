//
//  AppStyling.swift
//  MEDITATE
//
//  Created by User on 27/09/2021.
//

import UIKit
enum AppColors {
    case red
    case green
    case white
    case gray
    case black
    case grayedOutButton
    case profileWhite
    case transparentBlack
    var color: UIColor {
        switch self {
        case .red:
            return UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
        case .green:
            return UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1)
        case .white:
            return UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        case .gray:
            return UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
        case .black:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        case .grayedOutButton:
            return UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
        case .profileWhite:
            return UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        case .transparentBlack:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        }
    }
}
enum AppButtonImages {
    case goBackButton
    case goForwardButton
    case closedFocus
    case openFocus
    var image: UIImage {
        switch self {
        case .goBackButton:
            return UIImage(named: "Go-back")!
        case .goForwardButton:
            return UIImage(named: "Go-forward")!
        case .closedFocus:
            return UIImage(named: "Focus Icon Closed")!
        case .openFocus:
            return UIImage(named: "Focus Icon Open")!
        }
    }
}
enum AppFonts {
    case nunitoSansRegular
    case nunitoSansSemiBold
    case nunitoSansBold
    var font: String {
        switch self {
        case .nunitoSansRegular:
            return "nunito-sans.regular"
        case .nunitoSansSemiBold:
            return "nunito-sans.semibold"
        case .nunitoSansBold:
            return "nunito-sans.bold"
        }
    }
}
