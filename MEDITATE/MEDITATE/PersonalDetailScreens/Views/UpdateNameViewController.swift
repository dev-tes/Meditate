//
//  UpdateNameViewController.swift
//  MEDITATE
//
//  Created by Decagon on 13/10/2021.
//

import UIKit

class UpdateNameViewController: UIViewController, CustomProtocol {
  // MARK: PROPERTIES
  let backButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapUpdateNameBackButton), for: .touchUpInside)
    button.backgroundColor = .clear
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
    return button
  }()
  let nameTitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.frame = CGRect(x: 0, y: 0, width: 183, height: 58)
    label.textAlignment = .center
    label.numberOfLines = 0
    label.text = "Update your \nfull name"
    label.font = UIFont(name: "NunitoSans-Bold", size: 22)
    label.textAlignment = .center
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    return label
  }()
  let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.font = UIFont(name: "NunitoSans-Regular", size: 15)
    label.text = "Full name"
    label.textAlignment = .left
    return label
  }()
  let nameTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
    textField.leftViewMode = .always
    textField.autocorrectionType = .no
    textField.addTarget(self, action: #selector(updateNameValidationViews), for: .editingChanged)
    textField.font = UIFont(name: "NunitoSans-SemiBold", size: 15)
    textField.placeholder = "John Smith"
    textField.textAlignment = .left
    textField.autocapitalizationType = .words
    textField.layer.cornerRadius = 25.0
    textField.layer.borderWidth = 1.0
    textField.layer.borderColor = UIColor.black.cgColor
    return textField
  }()
  let nameValidationLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.font = UIFont(name: "NunitoSans-Regular", size: 13)
    label.textAlignment = .left
    return label
  }()
  let updateButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
    button.setTitle("Update", for: .normal)
    button.addTarget(self, action: #selector(didUpdateFullName), for: .touchUpInside)
    button.titleLabel?.font = UIFont(name: "NunitoSans-SemiBold", size: 17)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 25
    button.setImage(UIImage(named: "Go-forward"), for: .normal)
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 280, bottom: 0, right: 0)
    button.layer.masksToBounds = false
    button.clipsToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    addUpdateSubviews()
    setUpUpdateViewConstraints()
    layoutNameUpdateTitle()
  }
  func addUpdateSubviews() {
    view.addSubview(updateButton)
    view.addSubview(nameLabel)
    view.addSubview(nameTextField)
    view.addSubview(nameValidationLabel)
    view.addSubview(nameTitleLabel)
    view.addSubview(backButton)
  }
  // MARK: CONTRAINT SUBVIEWS
  func layoutNameUpdateTitle() {
    NSLayoutConstraint.activate([
      // NameUpdate TitleLabel Constraints
      nameTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      nameTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // NameUpdate BackButton Constraints
      backButton.topAnchor.constraint(equalTo: nameTitleLabel.topAnchor),
      backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
      ])
  }
  func setUpUpdateViewConstraints() {
    NSLayoutConstraint.activate([
      // NameUpdate Button constraint
      updateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      updateButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      updateButton.heightAnchor.constraint(equalToConstant: 50),
      // Name Label constraint
      nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      nameLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      nameLabel.heightAnchor.constraint(equalToConstant: 30),
      nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // Name TextField constraint
      nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
      nameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      nameTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      nameTextField.heightAnchor.constraint(equalToConstant: 50),
      // Name validation label contraint
      nameValidationLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5),
      nameValidationLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
      nameValidationLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      nameValidationLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  @objc func didTapUpdateNameBackButton() {
    navigationController?.popViewController(animated: true)
  }
  @objc func didUpdateFullName() {
    if nameValidationLabel.text == "Correct full name" {
        presentCustomAlertOnMainThread(title: "Full Name Updated", message: "You have successfully updated your full name", buttonTitle: "Done", imageNamed: "ProfileIconBlack", arrowBtn: false)
    }
  }
  func didTapActionBtn(view: UIView) {
      view.removeFromSuperview()
      let viewC = UpdateNameViewController()
      viewC.modalPresentationStyle = .fullScreen
      present(viewC, animated: true, completion: nil)
      print(view)
  }
  @objc func updateNameValidationViews(_ textField: UITextField) {
      DispatchQueue.main.async { [weak self] in
          guard let self = self else { return }
          self.validateName()
      }
  }
  func validateName() {
      guard let nameUpdateText = nameTextField.text else { return }
      let nameText = "[A-Za-z]([A-Za-z]{0,30}[A-Za-z])?"
      let nameRegex = nameText + " " + nameText + "[A-Za-z]{2,5}"
      let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
      let nameResult = namePredicate.evaluate(with: nameUpdateText)
      if nameUpdateText.isEmpty {
          nameTextField.layer.borderColor = UIColor.black.cgColor
          nameValidationLabel.text = ""
          updateButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
      } else if nameResult {
          nameTextField.layer.borderColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1).cgColor
          nameValidationLabel.text = "Correct full name"
          nameValidationLabel.textColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1)
          updateButton.backgroundColor = .black
      } else {
          nameTextField.layer.borderColor = UIColor.red.cgColor
          nameValidationLabel.text = "Please enter a valid full name"
          nameValidationLabel.textColor = .red
          updateButton.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00)
      }
  }
}
