//
//  TotalMeditationVCExtension.swift
//  MEDITATE
//
//  Created by  Decagon on 05/10/2021.
//

import UIKit

extension TotalMeditationViewController {
    // MARK: OBJC FUNCTIONS
    @objc func didTapTopBackArrowButton() {
        navigationController?.popViewController(animated: true)
    }
    @objc func didTapStressLevelButton() {
      let newController = StressLevelViewController()
      navigationController?.pushViewController(newController, animated: true)
    }
    @objc func didTapHappinessLevelButton() {
      let newController = HappinessLevelViewController()
      navigationController?.pushViewController(newController, animated: true)
    }
    // MARK: CONSTRAINTS
    func addSubviews() {
        view.addSubview(graphView)
        view.addSubview(mondayView)
        view.addSubview(tuesdayView)
        view.addSubview(wednesdayView)
        view.addSubview(thursdayView)
        view.addSubview(fridayView)
        view.addSubview(saturdayView)
        view.addSubview(sundayView)
        view.addSubview(mondayLabel)
        view.addSubview(tuesdayLabel)
        view.addSubview(wednesdayLabel)
        view.addSubview(thursdayLabel)
        view.addSubview(fridayLabel)
        view.addSubview(saturdayLabel)
        view.addSubview(sundayLabel)
        view.addSubview(topBackArrowButton)
        view.addSubview(pageTitleLabel)
        view.addSubview(totalMeditationView)
        view.addSubview(totalMeditationIcon)
        view.addSubview(totalMeditationTimerLabel)
        view.addSubview(totalMeditationTextLabel)
        view.addSubview(totalTimeSectionLabel)
        view.addSubview(totalMeditationTimeLabel)
        view.addSubview(meditationDurationLabel)
        view.addSubview(statisticsLabel)
      view.addSubview(stressLabel)
      view.addSubview(happinessLabel)
      view.addSubview(increaseStressLevelIcon)
      view.addSubview(decreaseStressLevelIcon)
      view.addSubview(increaseHappinessLevelLabel)
      view.addSubview(decreaseStressLevelLabel)
      view.addSubview(decreaseStressForwardIcon)
      view.addSubview(increaseHappinessForwardIcon)
    }
    func setupConstraintsTotalMeditation() {
        addSubviews()
      navigationController?.navigationBar.isHidden = true
      NSLayoutConstraint.activate([
        topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

        pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        totalMeditationView.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor, constant: 60),
        totalMeditationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        totalMeditationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        totalMeditationView.heightAnchor.constraint(equalToConstant: 100),

        totalMeditationIcon.topAnchor.constraint(equalTo: totalMeditationView.topAnchor, constant: 20),
        totalMeditationIcon.leadingAnchor.constraint(equalTo: totalMeditationView.leadingAnchor, constant: 10),

        totalMeditationTimerLabel.topAnchor.constraint(equalTo: totalMeditationView.topAnchor, constant: 20),
        totalMeditationTimerLabel.leadingAnchor.constraint(equalTo: totalMeditationIcon.leadingAnchor, constant: 75),
        totalMeditationTimerLabel.trailingAnchor.constraint(equalTo: totalMeditationView.trailingAnchor, constant: -10),

        totalMeditationTextLabel.topAnchor.constraint(equalTo: totalMeditationTimerLabel.bottomAnchor, constant: 5),
        totalMeditationTextLabel.leadingAnchor.constraint(equalTo: totalMeditationIcon.leadingAnchor, constant: 75),
        totalMeditationTextLabel.trailingAnchor.constraint(equalTo: totalMeditationView.trailingAnchor, constant: -10),

        totalTimeSectionLabel.topAnchor.constraint(equalTo: totalMeditationView.bottomAnchor, constant: 60),
        totalTimeSectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

        totalMeditationTimeLabel.topAnchor.constraint(equalTo: totalTimeSectionLabel.bottomAnchor, constant: 10),
        totalMeditationTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

        meditationDurationLabel.topAnchor.constraint(equalTo: totalMeditationView.bottomAnchor, constant: 60),
        meditationDurationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

        graphView.topAnchor.constraint(equalTo: totalMeditationTimeLabel.bottomAnchor, constant: 30),
        graphView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        graphView.widthAnchor.constraint(equalTo: view.widthAnchor),
        graphView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4),

        mondayLabel.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
        mondayLabel.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 30),

        tuesdayLabel.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
        tuesdayLabel.leadingAnchor.constraint(equalTo: mondayLabel.leadingAnchor, constant: 60),

        wednesdayLabel.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
        wednesdayLabel.leadingAnchor.constraint(equalTo: tuesdayLabel.leadingAnchor, constant: 60),

        thursdayLabel.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
        thursdayLabel.centerXAnchor.constraint(equalTo: graphView.centerXAnchor),

        fridayLabel.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
        fridayLabel.trailingAnchor.constraint(equalTo: saturdayLabel.trailingAnchor, constant: -60),

        saturdayLabel.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
        saturdayLabel.trailingAnchor.constraint(equalTo: sundayLabel.trailingAnchor, constant: -60),

        sundayLabel.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -10),
        sundayLabel.trailingAnchor.constraint(equalTo: graphView.trailingAnchor, constant: -30),

        mondayView.bottomAnchor.constraint(equalTo: mondayLabel.topAnchor, constant: -10),
        mondayView.heightAnchor.constraint(equalToConstant: 73),
        mondayView.widthAnchor.constraint(equalToConstant: 15),
        mondayView.leadingAnchor.constraint(equalTo: mondayLabel.leadingAnchor, constant: -2),

        tuesdayView.bottomAnchor.constraint(equalTo: tuesdayLabel.topAnchor, constant: -10),
        tuesdayView.heightAnchor.constraint(equalToConstant: 143),
        tuesdayView.widthAnchor.constraint(equalToConstant: 15),
        tuesdayView.leadingAnchor.constraint(equalTo: tuesdayLabel.leadingAnchor, constant: -2),

        wednesdayView.bottomAnchor.constraint(equalTo: wednesdayLabel.topAnchor, constant: -10),
        wednesdayView.heightAnchor.constraint(equalToConstant: 87),
        wednesdayView.widthAnchor.constraint(equalToConstant: 15),
        wednesdayView.leadingAnchor.constraint(equalTo: wednesdayLabel.leadingAnchor, constant: -2),

        thursdayView.bottomAnchor.constraint(equalTo: thursdayLabel.topAnchor, constant: -10),
        thursdayView.heightAnchor.constraint(equalToConstant: 167),
        thursdayView.widthAnchor.constraint(equalToConstant: 15),
        thursdayView.leadingAnchor.constraint(equalTo: thursdayLabel.leadingAnchor, constant: -2),

        fridayView.bottomAnchor.constraint(equalTo: fridayLabel.topAnchor, constant: -10),
        fridayView.heightAnchor.constraint(equalToConstant: 57),
        fridayView.widthAnchor.constraint(equalToConstant: 15),
        fridayView.leadingAnchor.constraint(equalTo: fridayLabel.leadingAnchor, constant: -2),

        saturdayView.bottomAnchor.constraint(equalTo: saturdayLabel.topAnchor, constant: -10),
        saturdayView.heightAnchor.constraint(equalToConstant: 112),
        saturdayView.widthAnchor.constraint(equalToConstant: 15),
        saturdayView.leadingAnchor.constraint(equalTo: saturdayLabel.leadingAnchor, constant: -2),

        sundayView.bottomAnchor.constraint(equalTo: sundayLabel.topAnchor, constant: -10),
        sundayView.heightAnchor.constraint(equalToConstant: 152),
        sundayView.widthAnchor.constraint(equalToConstant: 15),
        sundayView.leadingAnchor.constraint(equalTo: sundayLabel.leadingAnchor, constant: -2),

        statisticsLabel.topAnchor.constraint(equalTo: graphView.bottomAnchor, constant: 30),
        statisticsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

        decreaseStressLevelIcon.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 30),
        decreaseStressLevelIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

        increaseStressLevelIcon.topAnchor.constraint(equalTo: decreaseStressLevelIcon.bottomAnchor, constant: 30),
        increaseStressLevelIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

        stressLabel.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 30),
        stressLabel.leadingAnchor.constraint(equalTo: decreaseStressLevelIcon.leadingAnchor, constant: 75),

        decreaseStressLevelLabel.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 10),
        decreaseStressLevelLabel.leadingAnchor.constraint(equalTo: decreaseStressLevelIcon.leadingAnchor, constant: 75),

        happinessLabel.topAnchor.constraint(equalTo: decreaseStressLevelLabel.bottomAnchor, constant: 30),
        happinessLabel.leadingAnchor.constraint(equalTo: increaseStressLevelIcon.leadingAnchor, constant: 75),

        increaseHappinessLevelLabel.topAnchor.constraint(equalTo: happinessLabel.bottomAnchor, constant: 10),
        increaseHappinessLevelLabel.leadingAnchor.constraint(equalTo: increaseStressLevelIcon.leadingAnchor, constant: 75),

        decreaseStressForwardIcon.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 40),
        decreaseStressForwardIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

        increaseHappinessForwardIcon.topAnchor.constraint(equalTo: decreaseStressLevelLabel.bottomAnchor, constant: 40),
        increaseHappinessForwardIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
      ])
    }
}
