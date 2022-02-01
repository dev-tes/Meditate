//
//  ProfileVCExtension.swift
//  MEDITATE
//
//  Created by  Decagon on 05/10/2021.
//

import UIKit
extension ProfileViewController {
    // MARK: CONSTRAINTS
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        scrollView.addSubview(contentView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 25).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true

        userButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        userButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36).isActive = true

        userStrokeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        userStrokeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 29).isActive = true

        usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: userButton.trailingAnchor, constant: 25).isActive = true

        userEmailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5).isActive = true
        userEmailLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor).isActive = true

        targetView.topAnchor.constraint(equalTo: userEmailLabel.bottomAnchor, constant: 60).isActive = true
        targetView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        targetView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        targetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36).isActive = true
        targetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36).isActive = true

        targetAchievedLabel.topAnchor.constraint(equalTo: targetView.topAnchor, constant: 24).isActive = true
        targetAchievedLabel.leadingAnchor.constraint(equalTo: targetView.leadingAnchor, constant: 15).isActive = true

        learnMoreLabel.topAnchor.constraint(equalTo: targetAchievedLabel.bottomAnchor, constant: 7).isActive = true
        learnMoreLabel.leadingAnchor.constraint(equalTo: targetAchievedLabel.leadingAnchor).isActive = true

        targetAchievedIcon.topAnchor.constraint(equalTo: targetAchievedLabel.topAnchor).isActive = true
        targetAchievedIcon.trailingAnchor.constraint(equalTo: targetView.trailingAnchor, constant: -36).isActive = true

        progressLabel.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 50).isActive = true
        progressLabel.leadingAnchor.constraint(equalTo: targetView.leadingAnchor).isActive = true

        totalMeditationView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 30).isActive = true
        totalMeditationView.leadingAnchor.constraint(equalTo: progressLabel.leadingAnchor).isActive = true
        totalMeditationView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        totalMeditationView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        totalMeditationIcon.topAnchor.constraint(equalTo: totalMeditationView.topAnchor, constant: 27).isActive = true
        totalMeditationIcon.centerXAnchor.constraint(equalTo: totalMeditationView.centerXAnchor).isActive = true

        totalMeditationTimerLabel.topAnchor.constraint(equalTo: totalMeditationIcon.bottomAnchor, constant: 20).isActive = true
        totalMeditationTimerLabel.centerXAnchor.constraint(equalTo: totalMeditationView.centerXAnchor).isActive = true
        totalMeditationTextLabel.topAnchor.constraint(equalTo: totalMeditationTimerLabel.bottomAnchor, constant: 5).isActive = true
        totalMeditationTextLabel.centerXAnchor.constraint(equalTo: totalMeditationView.centerXAnchor).isActive = true

        longestSessionView.topAnchor.constraint(equalTo: totalMeditationView.topAnchor).isActive = true
        longestSessionView.trailingAnchor.constraint(equalTo: targetView.trailingAnchor).isActive = true
        longestSessionView.widthAnchor.constraint(equalTo: totalMeditationView.widthAnchor).isActive = true
        longestSessionView.heightAnchor.constraint(equalTo: totalMeditationView.heightAnchor).isActive = true

        longestSessionIcon.topAnchor.constraint(equalTo: longestSessionView.topAnchor, constant: 27).isActive = true
        longestSessionIcon.centerXAnchor.constraint(equalTo: longestSessionView.centerXAnchor).isActive = true

        longestSessionTimerLabel.topAnchor.constraint(equalTo: longestSessionIcon.bottomAnchor, constant: 25).isActive = true
        longestSessionTimerLabel.centerXAnchor.constraint(equalTo: longestSessionView.centerXAnchor).isActive = true
        longestSessionTextLabel.topAnchor.constraint(equalTo: longestSessionTimerLabel.bottomAnchor, constant: 5).isActive = true
        longestSessionTextLabel.centerXAnchor.constraint(equalTo: longestSessionView.centerXAnchor).isActive = true

        achievementsLabel.topAnchor.constraint(equalTo: totalMeditationView.bottomAnchor, constant: 70).isActive = true
        achievementsLabel.leadingAnchor.constraint(equalTo: totalMeditationView.leadingAnchor).isActive = true

        achievementsView1.topAnchor.constraint(equalTo: achievementsLabel.bottomAnchor, constant: 30).isActive = true
        achievementsView1.leadingAnchor.constraint(equalTo: achievementsLabel.leadingAnchor).isActive = true
        achievementsView1.trailingAnchor.constraint(equalTo: longestSessionView.trailingAnchor).isActive = true
        achievementsView1.heightAnchor.constraint(equalToConstant: 58).isActive = true

        achievementIcon1.topAnchor.constraint(equalTo: achievementsView1.topAnchor, constant: 5).isActive = true
        achievementIcon1.leadingAnchor.constraint(equalTo: achievementsView1.leadingAnchor, constant: 10).isActive = true

        stressDecreasedLabel.topAnchor.constraint(equalTo: achievementIcon1.topAnchor, constant: 15).isActive = true
        stressDecreasedLabel.leadingAnchor.constraint(equalTo: achievementIcon1.trailingAnchor, constant: 20).isActive = true

        goToStressDecreaseIcon.topAnchor.constraint(equalTo: stressDecreasedLabel.topAnchor, constant: -3).isActive = true
        goToStressDecreaseIcon.trailingAnchor.constraint(equalTo: achievementsView1.trailingAnchor, constant: -20).isActive = true

        achievementsView2.topAnchor.constraint(equalTo: achievementsView1.bottomAnchor, constant: 20).isActive = true
        achievementsView2.leadingAnchor.constraint(equalTo: achievementsView1.leadingAnchor).isActive = true
        achievementsView2.trailingAnchor.constraint(equalTo: achievementsView1.trailingAnchor).isActive = true
        achievementsView2.heightAnchor.constraint(equalTo: achievementsView1.heightAnchor).isActive = true

        achievementIcon2.topAnchor.constraint(equalTo: achievementsView2.topAnchor, constant: 5).isActive = true
        achievementIcon2.leadingAnchor.constraint(equalTo: achievementsView2.leadingAnchor, constant: 10).isActive = true

        focusMLabel.topAnchor.constraint(equalTo: achievementIcon2.topAnchor, constant: 15).isActive = true
        focusMLabel.leadingAnchor.constraint(equalTo: achievementIcon2.trailingAnchor, constant: 20).isActive = true

        goToFocusMIcon.topAnchor.constraint(equalTo: focusMLabel.topAnchor, constant: -3).isActive = true
        goToFocusMIcon.trailingAnchor.constraint(equalTo: achievementsView2.trailingAnchor, constant: -20).isActive = true

        achievementsView3.topAnchor.constraint(equalTo: achievementsView2.bottomAnchor, constant: 20).isActive = true
        achievementsView3.leadingAnchor.constraint(equalTo: achievementsView2.leadingAnchor).isActive = true
        achievementsView3.trailingAnchor.constraint(equalTo: achievementsView2.trailingAnchor).isActive = true
        achievementsView3.heightAnchor.constraint(equalTo: achievementsView2.heightAnchor).isActive = true
        achievementsView3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        achievementIcon3.topAnchor.constraint(equalTo: achievementsView3.topAnchor, constant: 5).isActive = true
        achievementIcon3.leadingAnchor.constraint(equalTo: achievementsView3.leadingAnchor, constant: 10).isActive = true

        consistentScheduleLabel.topAnchor.constraint(equalTo: achievementIcon3.topAnchor, constant: 15).isActive = true
        consistentScheduleLabel.leadingAnchor.constraint(equalTo: achievementIcon3.trailingAnchor, constant: 20).isActive = true

        goToConsistentScheduleIcon.topAnchor.constraint(equalTo: consistentScheduleLabel.topAnchor, constant: -3).isActive = true
        goToConsistentScheduleIcon.trailingAnchor.constraint(equalTo: achievementsView3.trailingAnchor, constant: -20).isActive = true
    }
}
