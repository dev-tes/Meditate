//
//  UIViewController+Extension.swift
//  MEDITATE
//
//  Created by Tes on 25/10/2021.
//

import UIKit

extension UIViewController {

    func presentCustomAlertOnMainThread(title: String, message: String, buttonTitle: String, imageNamed: String, arrowBtn: Bool) {
    DispatchQueue.main.async {
        let alertVC = CustomAlertViewController(title: title, message: message, buttonTitle: buttonTitle, imageNamed: imageNamed, arrowBtn: arrowBtn)
      alertVC.delegate = self as? CustomAlertVCDelegate
      alertVC.modalPresentationStyle = .overFullScreen
      alertVC.modalTransitionStyle = .crossDissolve
      self.present(alertVC, animated: true)
    }
  }
}

