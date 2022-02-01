//
//  ContactUsViewController.swift
//  MEDITATE
//
//  Created by user on 13/10/2021.
//

import UIKit

class ContactUsViewController: UIViewController {
let backImage: UIButton = {
  let backImage = UIButton()
  backImage.setImage(UIImage(named: "Go Back Icon"), for: .normal)
  backImage.translatesAutoresizingMaskIntoConstraints = false
  backImage.addTarget(self, action: #selector(goBackToProfile), for: .touchUpInside)
  return backImage
}()

  let contactUsLabel: UILabel = {
  let title = UILabel()
  title.translatesAutoresizingMaskIntoConstraints = false
  title.textAlignment = .center
  title.numberOfLines = 1
  title.font = UIFont(name: "NunitoSans-Bold", size: 22)
  title.text = "Contact Us"
  title.textColor = .black
  return title
  }()

  let phoneImageIcon: UIButton = {
    let phoneImage = UIButton()
    phoneImage.setImage(UIImage(named: "call-Icon"), for: .normal)
    phoneImage.translatesAutoresizingMaskIntoConstraints = false
    return phoneImage
  }()
  let phoneText: UILabel = {
    let title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.numberOfLines = 1
    title.font = UIFont(name: "NunitoSans-Bold", size: 19)
    title.text = "Phone"
    return title
  }()

  let phoneNumber: UILabel = {
    let title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.numberOfLines = 1
    title.font = UIFont(name: "NunitoSans", size: 13)
    title.text = "+01 234567890"
    return title
  }()

  let phoneForwardArrow: UIButton = {
    let forward = UIButton()
    forward.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
    forward.translatesAutoresizingMaskIntoConstraints = false
    forward.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    return forward
  }()

  let emailImageIcon: UIButton = {
    let emailImage = UIButton()
    emailImage.setImage(UIImage(named: "message-Icon"), for: .normal)
    emailImage.translatesAutoresizingMaskIntoConstraints = false
    return emailImage
  }()

  let emailTitle: UILabel = {
    let title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.numberOfLines = 1
    title.font = UIFont(name: "NunitoSans-Bold", size: 19)
    title.text = "Email"
    return title
  }()

  let emailBody: UILabel = {
    let title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.numberOfLines = 1
    title.font = UIFont(name: "Nunito Sans", size: 13)
    title.text = "support@relax.io"
    return title
  }()

  let emailForwardArrow: UIButton = {
    let forwardArrow = UIButton()
    forwardArrow.translatesAutoresizingMaskIntoConstraints = false
    forwardArrow.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
    forwardArrow.addTarget(self, action: #selector(emailAlert), for: .touchUpInside)
    return forwardArrow
  }()

  let appChatImageIcon: UIButton = {
    let chatIcon = UIButton()
    chatIcon.setImage(UIImage(named: "chat-Icon"), for: .normal)
    chatIcon.translatesAutoresizingMaskIntoConstraints = false
    return chatIcon
  }()

  let appChatTitle: UILabel = {
    let title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.font = UIFont(name: "NunitoSans-Bold", size: 19)
    title.text = "App Chat"
    return title
  }()

  let appChatBody: UILabel = {
    let title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.font = UIFont(name: "Nunito Sans", size: 13)
    title.text = "Average waiting time: 5 min"
    return title
  }()

  let appChatForwardArrow: UIButton = {
    let forwardArrow = UIButton()
    forwardArrow.translatesAutoresizingMaskIntoConstraints = false
    forwardArrow.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
    forwardArrow.addTarget(self, action: #selector(appChatAlert), for: .touchUpInside)
    return forwardArrow
  }()

  @objc func showAlert() {
//    customAlert.showAlert(setIconName: "call-Icon", title: "Phone", message: "You can just call us directly and we will help you", On: self, setbuttonTitle: "Call Us", buttonImage: "contactUs")
    presentCustomAlertOnMainThread(title: "Phone", message: "You can just call us directly and we will help you", buttonTitle: "Call Us", imageNamed: "call-Icon", arrowBtn: true)
  }
  @objc func emailAlert() {
//    customAlert.showAlert(setIconName: "message-Icon", title: "Email", message: "Just send us an email and we will \n get back to you", On: self, setbuttonTitle: "Send Email", buttonImage: "message-Icon")
    presentCustomAlertOnMainThread(title: "Email", message: "Just send us an email and we will \n get back to you", buttonTitle: "Send Email", imageNamed: "message-Icon", arrowBtn: true)
  }
  @objc func appChatAlert() {
//    customAlert.showAlert(setIconName: "chat-Icon", title: "App Chat", message: "Just start  a chat with us and we \n will get back to you", On: self, setbuttonTitle: "Start Chat", buttonImage: "chat-Icon")
    presentCustomAlertOnMainThread(title: "App Chat", message: "Just start  a chat with us and we \n will get back to you", buttonTitle: "Start Chat", imageNamed: "chat-Icon", arrowBtn: true)
  }
  @objc func goBackToProfile() {
    navigationController?.popViewController(animated: true)
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    updateConstraint()
    view.backgroundColor = .white
  }
  }
