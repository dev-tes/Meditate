//
//  PasswordLoginVC+Extension.swift
//  MEDITATE
//
//  Created by  Decagon on 27/10/2021.
//

import Foundation
import FirebaseAuth
extension PasswordLoginViewController: CustomAlertVCDelegate {
    func dismissAlertAndGoToAnotherScreen() {
        Auth.auth().sendPasswordReset(withEmail: email)
        let newVC = EmailLoginViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}
