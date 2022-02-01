//
//  MeditationSubViewController.swift
//  MEDITATE
//
//  Created by  Decagon on 12/10/2021.
//

import UIKit

class MeditationSubViewController: UIViewController {
      // MARK: - Properties
      let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
      }()
      lazy var sessionNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sleep better"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Nunito Sans", size: 22)
        label.numberOfLines = 1
        return label
      }()
      lazy var pauseIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "BigPause"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
      }()
      lazy var strokeIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "BigCircumference"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
      }()
      lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "02:35"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 25)
        label.numberOfLines = 1
        return label
      }()
      // MARK: - Selector
      @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
      }
      // MARK: - View Lifecycle
      override func viewDidLoad() {
        super.viewDidLoad()
        constraintViews()
      }
      // MARK: - Constraints
      func addDefaultViews() {
        view.addSubview(backButton)
        view.addSubview(sessionNameLabel)
        view.addSubview(pauseIcon)
        view.addSubview(strokeIcon)
        view.addSubview(timeLabel)
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
      }
      func constraintViews() {
        addDefaultViews()
        self.navigationItem.setHidesBackButton(true, animated: true)
        NSLayoutConstraint.activate([
          backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
          backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
          backButton.heightAnchor.constraint(equalToConstant: 28),
          backButton.widthAnchor.constraint(equalToConstant: 28),
          sessionNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          sessionNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
          strokeIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          strokeIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
          pauseIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          pauseIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -12),
          timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 180)
        ])
      }
}
