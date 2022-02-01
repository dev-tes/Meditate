//
//  SettingsViewController+Extension.swift
//  MEDITATE
//
//  Created by  Decagon on 27/10/2021.
//

import Foundation
import Firebase

extension SettingsViewController: CustomAlertVCDelegate {
    func dismissAlertAndGoToAnotherScreen() {
        let newVC = SignUpEmailViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}
