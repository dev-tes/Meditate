//
//  LongestSessionViewController.swift
//  MEDITATE
//
//  Created by TESLEEM on 04/10/2021.
//

import UIKit

class LongestSessionViewController: UIViewController {
    // MARK: PROPERTIES
    let backArrowButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Go Back Icon"), for: .normal)
        return button
    }()
    let pageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Longest Session"
        label.numberOfLines = 2
        label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let icon1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "homeScreenPlayAlertIcon"), for: .normal)
        return button
    }()
    let timeLabel1: UILabel = {
        let label = UILabel()
        label.text = "35 minutes"
        label.font = UIFont(name: "Nunito Sans", size: 16)
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let descriptionLabel1: UILabel = {
        let label = UILabel()
        label.text = "You longest meditation session so \nfar since you have started."
        label.numberOfLines = 2
        label.font = UIFont(name: "Nunito Sans", size: 12)
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let view2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let icon2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "homeScreenPlayAlertIcon"), for: .normal)
        return button
    }()
    let timeLabel2: UILabel = {
        let label = UILabel()
        label.text = "32 minutes"
        label.font = UIFont(name: "Nunito Sans", size: 16)
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let descriptionLabel2: UILabel = {
        let label = UILabel()
        label.text = "You second longest meditation \nsession so far."
        label.numberOfLines = 2
        label.font = UIFont(name: "Nunito Sans", size: 12)
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let longestSessionView3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let icon3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "homeScreenPlayAlertIcon"), for: .normal)
        return button
    }()
    let timeLabel3: UILabel = {
        let label = UILabel()
        label.text = "27 minutes"
        label.font = UIFont(name: "Nunito Sans", size: 18)
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let descriptionLabel3: UILabel = {
        let label = UILabel()
        label.text = "You third longest meditation \nsession so far."
        label.numberOfLines = 2
        label.font = UIFont(name: "Nunito Sans", size: 12)
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let shareForwardArrowButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(AppButtonImages.goForwardButton.image, for: .normal)
        return button
    }()
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.setTitleColor(AppColors.white.color, for: .normal)
        button.layer.cornerRadius = 28
        button.backgroundColor = AppColors.black.color
        button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 17)
        button.isEnabled = true
        return button
    }()
    // MARK: VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        addSubviewsToView()
        setupViewConstriants()
        view.backgroundColor = AppColors.gray.color
        self.tabBarController?.tabBar.isHidden = true
    }
    // MARK: CONSTRAINTS
    func addSubviewsToView() {
        view.addSubview(backArrowButton)
        view.addSubview(pageTitleLabel)
        view.addSubview(view1)
        view.addSubview(icon1)
        view.addSubview(timeLabel1)
        view.addSubview(descriptionLabel1)
        view.addSubview(view2)
        view.addSubview(icon2)
        view.addSubview(timeLabel2)
        view.addSubview(descriptionLabel2)
        view.addSubview(longestSessionView3)
        view.addSubview(icon3)
        view.addSubview(timeLabel3)
        view.addSubview(descriptionLabel3)
        view.addSubview(shareButton)
        view.addSubview(shareForwardArrowButton)
    }
    func setupViewConstriants() {
        NSLayoutConstraint.activate([
            backArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

            pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            view1.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor, constant: 30),
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            view1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            view1.heightAnchor.constraint(equalToConstant: 120),

            icon1.topAnchor.constraint(equalTo: view1.topAnchor, constant: 26),
            icon1.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 10),

            timeLabel1.topAnchor.constraint(equalTo: view1.topAnchor, constant: 26),
            timeLabel1.leadingAnchor.constraint(equalTo: icon1.leadingAnchor, constant: 95),
            timeLabel1.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -10),

            descriptionLabel1.topAnchor.constraint(equalTo: timeLabel1.bottomAnchor, constant: 7),
            descriptionLabel1.leadingAnchor.constraint(equalTo: icon1.leadingAnchor, constant: 95),
            descriptionLabel1.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -10),

            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 30),
            view2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            view2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            view2.heightAnchor.constraint(equalToConstant: 120),

            icon2.topAnchor.constraint(equalTo: view2.topAnchor, constant: 26),
            icon2.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 10),

            timeLabel2.topAnchor.constraint(equalTo: view2.topAnchor, constant: 26),
            timeLabel2.leadingAnchor.constraint(equalTo: icon2.leadingAnchor, constant: 95),
            timeLabel2.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: -10),

            descriptionLabel2.topAnchor.constraint(equalTo: timeLabel2.bottomAnchor, constant: 7),
            descriptionLabel2.leadingAnchor.constraint(equalTo: icon2.leadingAnchor, constant: 95),
            descriptionLabel2.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: -10),

            longestSessionView3.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 30),
            longestSessionView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            longestSessionView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            longestSessionView3.heightAnchor.constraint(equalToConstant: 120),

            icon3.topAnchor.constraint(equalTo: longestSessionView3.topAnchor, constant: 26),
            icon3.leadingAnchor.constraint(equalTo: longestSessionView3.leadingAnchor, constant: 10),

            timeLabel3.topAnchor.constraint(equalTo: longestSessionView3.topAnchor, constant: 26),
            timeLabel3.leadingAnchor.constraint(equalTo: icon3.leadingAnchor, constant: 95),
            timeLabel3.trailingAnchor.constraint(equalTo: longestSessionView3.trailingAnchor, constant: -10),

            descriptionLabel3.topAnchor.constraint(equalTo: timeLabel3.bottomAnchor, constant: 7),
            descriptionLabel3.leadingAnchor.constraint(equalTo: icon3.leadingAnchor, constant: 95),
            descriptionLabel3.trailingAnchor.constraint(equalTo: longestSessionView3.trailingAnchor, constant: -10),

            shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            shareButton.heightAnchor.constraint(equalToConstant: 60),

            shareForwardArrowButton.bottomAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: -16),
            shareForwardArrowButton.trailingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: -20)
        ])
    }
    // MARK: OBJC FUNCTIONS
    @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
    }
    @objc func didTapShareButton() {
        presentCustomAlertOnMainThread(title: "Share with Friends", message: "You can share all your achievements with your friends.", buttonTitle: "Share", imageNamed: "ShareIcon", arrowBtn: true)
    }
}
