//
//  ContactUsVCExtension.swift
//  MEDITATE
//
//  Created by user on 13/10/2021.
//

import UIKit

extension ContactUsViewController {
  func updateConstraint() {
   view.addSubview(backImage)
   view.addSubview(contactUsLabel)
   view.addSubview(phoneImageIcon)
   view.addSubview(phoneText)
   view.addSubview(phoneForwardArrow)
   view.addSubview(emailImageIcon)
   view.addSubview(emailTitle)
   view.addSubview(emailBody)
   view.addSubview(phoneNumber)
   view.addSubview(appChatImageIcon)
   view.addSubview(appChatTitle)
   view.addSubview(appChatBody)
   view.addSubview(appChatForwardArrow)
   view.addSubview(emailForwardArrow)

   NSLayoutConstraint.activate([
     backImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
     backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
     contactUsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 96),
     contactUsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -96),
     contactUsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
     phoneImageIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 159),
     phoneImageIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
     phoneText.topAnchor.constraint(equalTo: view.topAnchor, constant: 161),
     phoneText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 98),
     phoneForwardArrow.topAnchor.constraint(equalTo: view.topAnchor, constant: 169),
     phoneForwardArrow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
     emailImageIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 237),
     emailImageIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
     emailTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 239),
     emailTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 98),
     emailBody.topAnchor.constraint(equalTo: view.topAnchor, constant: 267),
     emailBody.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 98),
     phoneNumber.topAnchor.constraint(equalTo: view.topAnchor, constant: 189),
     phoneNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 98),
     appChatImageIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 315),
     appChatImageIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
     appChatTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 317),
     appChatTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 98),
     appChatBody.topAnchor.constraint(equalTo: view.topAnchor, constant: 345),
     appChatBody.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 98),
     appChatForwardArrow.topAnchor.constraint(equalTo: view.topAnchor, constant: 325),
     appChatForwardArrow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
     emailForwardArrow.topAnchor.constraint(equalTo: view.topAnchor, constant: 247),
     emailForwardArrow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
   ])
 }

}
