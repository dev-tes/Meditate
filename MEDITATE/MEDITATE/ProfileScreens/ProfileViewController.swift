//
//  ProfileViewController.swift
//  MEDITATE
//
//  Created by  Decagon on 03/10/2021.
//

import UIKit

class ProfileViewController: UIViewController, UIScrollViewAccessibilityDelegate {
    // MARK: PROPERTIES
    let scrollView = UIScrollView()
    let contentView = UIView()
    let profileLabel: UILabel = {
      let label = UILabel()
      label.text = "Profile"
      label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 25)
      label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let settings: UIButton = {
        let settingsButton = UIButton()
        settingsButton.setImage(UIImage(named: "SettingsIcon"), for: .normal)
//        settingsButton.isUserInteractionEnabled = true
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
        return settingsButton
    }()
    let userButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ProfileIconBlack"), for: .normal)
        return button
    }()
    let userStrokeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Stroke"), for: .normal)
        return button
    }()
    let usernameLabel: UILabel = {
      let label = UILabel()
      label.text = "John Smith"
      label.font = UIFont(name: "Nunito Sans", size: 20)
      label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let userEmailLabel: UILabel = {
      let label = UILabel()
      label.text = "johnsmith@gmail.com"
      label.font = UIFont(name: "Nunito Sans", size: 14)
      label.font = UIFont.systemFont(ofSize: 18, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let targetView: UIView = {
      let view = UIView()
        view.backgroundColor = .white
      view.layer.cornerRadius = 15
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let targetAchievedLabel: UILabel = {
      let label = UILabel()
      label.text = "Target Achieved"
      label.font = UIFont(name: "Nunito Sans", size: 18)
      label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let learnMoreLabel: UILabel = {
      let label = UILabel()
      label.text = "Learn more about everything that \n you have achieved below"
      label.numberOfLines = 2
      label.font = UIFont(name: "Nunito Sans", size: 14)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let targetAchievedIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "TargetAchievedIcon"), for: .normal)
        button.addTarget(self, action: #selector(didTapTargetAchievedButton), for: .touchUpInside)
        return button
    }()
    let progressLabel: UILabel = {
      let label = UILabel()
      label.text = "Progress"
        label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let totalMeditationView: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 15
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let totalMeditationIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "TotalTimeIcon"), for: .normal)
        button.addTarget(self, action: #selector(didTapTotalMeditationButton), for: .touchUpInside)
        return button
    }()
    let totalMeditationTimerLabel: UILabel = {
      let label = UILabel()
      label.text = "120 h"
        label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 16)
      label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let totalMeditationTextLabel: UILabel = {
      let label = UILabel()
      label.text = "Total meditation"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 12, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let longestSessionView: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 15
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let longestSessionIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "PlayIcon"), for: .normal)
        button.addTarget(self, action: #selector(didTapLongestSessionButton), for: .touchUpInside)
        return button
    }()
    let longestSessionTimerLabel: UILabel = {
      let label = UILabel()
      label.text = "35 min"
      label.font = UIFont(name: "Nunito Sans", size: 16)
      label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let longestSessionTextLabel: UILabel = {
      let label = UILabel()
      label.text = "Longest session"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 12, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let achievementsLabel: UILabel = {
      let label = UILabel()
      label.text = "Achievements"
      label.font = UIFont(name: "Nunito Sans", size: 20)
      label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let achievementsView1: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 15
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let achievementIcon1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Small"), for: .normal)
        button.addTarget(self, action: #selector(goToStressIndicatorPage), for: .touchUpInside)
        return button
    }()
    let stressDecreasedLabel: UILabel = {
      let label = UILabel()
      label.text = "Stress Decrease"
      label.font = UIFont(name: "Nunito Sans", size: 18)
      label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let goToStressDecreaseIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
        button.addTarget(self, action: #selector(goToStressIndicatorPage), for: .touchUpInside)
        return button
    }()
    let achievementsView2: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 15
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let achievementIcon2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Small"), for: .normal)
        button.addTarget(self, action: #selector(goToFocusM), for: .touchUpInside)
        return button
    }()
    let focusMLabel: UILabel = {
      let label = UILabel()
      label.text = "Focus Master"
      label.font = UIFont(name: "Nunito Sans", size: 18)
      label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let goToFocusMIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
        button.addTarget(self, action: #selector(goToFocusM), for: .touchUpInside)
        return button
    }()
    let achievementsView3: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      view.layer.cornerRadius = 15
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let achievementIcon3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Small"), for: .normal)
        button.addTarget(self, action: #selector(goToConsistentSchedulePage), for: .touchUpInside)
        return button
    }()
    let consistentScheduleLabel: UILabel = {
      let label = UILabel()
      label.text = "Consistent Schedule"
      label.font = UIFont(name: "Nunito Sans", size: 18)
      label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let goToConsistentScheduleIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
        button.addTarget(self, action: #selector(goToConsistentSchedulePage), for: .touchUpInside)
        return button
    }()
    // MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setupScrollView()
      navigationController?.navigationBar.isHidden = true
      scrollView.showsVerticalScrollIndicator = false
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
//    @objc func goToSettings() {
//      let settingsViewController = SettingsViewController()
//      navigationController?.pushViewController(settingsViewController, animated: true)
//    }
    // MARK: CONSTRAINTS
    private func setUpViews() {
        view.backgroundColor = AppColors.profileWhite.color
        setupConstraints()
    }
    private func setupConstraints() {
        view.addSubview(settings)
        view.addSubview(profileLabel)
        contentView.isUserInteractionEnabled = true
        contentView.addSubview(userButton)
        contentView.addSubview(userStrokeButton)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(userEmailLabel)
        contentView.addSubview(targetView)
        contentView.addSubview(targetAchievedLabel)
        contentView.addSubview(learnMoreLabel)
        contentView.addSubview(targetAchievedIcon)
        contentView.addSubview(progressLabel)
        contentView.addSubview(totalMeditationView)
        contentView.addSubview(totalMeditationIcon)
        contentView.addSubview(totalMeditationTimerLabel)
        contentView.addSubview(totalMeditationTextLabel)
        contentView.addSubview(longestSessionView)
        contentView.addSubview(longestSessionIcon)
        contentView.addSubview(longestSessionTimerLabel)
        contentView.addSubview(longestSessionTextLabel)
        contentView.addSubview(achievementsLabel)
        contentView.addSubview(achievementsView1)
        contentView.addSubview(achievementIcon1)
        contentView.addSubview(stressDecreasedLabel)
        contentView.addSubview(goToStressDecreaseIcon)
        contentView.addSubview(achievementsView2)
        contentView.addSubview(achievementIcon2)
        contentView.addSubview(focusMLabel)
        contentView.addSubview(goToFocusMIcon)
        contentView.addSubview(achievementsView3)
        contentView.addSubview(achievementIcon3)
        contentView.addSubview(consistentScheduleLabel)
        contentView.addSubview(goToConsistentScheduleIcon)
        NSLayoutConstraint.activate([
            settings.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            settings.heightAnchor.constraint(equalToConstant: 28),
            settings.widthAnchor.constraint(equalToConstant: 28),
            settings.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }
    // MARK: OBJC FUNCTION
    @objc func didTapSettingsButton() {
      let settingsViewController = SettingsViewController()
      navigationController?.pushViewController(settingsViewController, animated: true)
    }
    @objc func didTapTotalMeditationButton() {
      let newController = TotalMeditationViewController()
      navigationController?.pushViewController(newController, animated: true)
    }
    @objc func didTapLongestSessionButton() {
      let newController = LongestSessionViewController()
      navigationController?.pushViewController(newController, animated: true)
    }
    @objc func didTapTargetAchievedButton() {
      presentCustomAlertOnMainThread(title: "Target Achieved", message: "Congratulations, you now have the Focus Master badge", buttonTitle: "Explore", imageNamed: "TargetAchievedIcon", arrowBtn: true)
    }
    @objc func goToFocusM() {
      let newController = FocusViewController()
      navigationController?.pushViewController(newController, animated: true)
    }
    @objc func goToStressIndicatorPage() {
        let newController = StressDecreaseViewController()
        navigationController?.pushViewController(newController, animated: true)
    }
    @objc func goToConsistentSchedulePage() {
        let newController = ConsistentScheduleViewController()
        navigationController?.pushViewController(newController, animated: true)
    }
}
