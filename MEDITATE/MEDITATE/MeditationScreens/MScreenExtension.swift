//
//  MScreenExtension.swift
//  MEDITATE
//
//  Created by  Decagon on 12/10/2021.
//

import UIKit

extension MeditationViewController {
    // MARK: - Constraints
    func addDefaultViews() {
        view.addSubview(backButton)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(meditationTopView)
        meditationTopView.addSubview(sleepBetterLabel)
        meditationTopView.addSubview(timeLabel)
        meditationTopView.addSubview(playButton)
        meditationTopView.addSubview(sleepBetterImage)
        contentView.addSubview(sessionLabel)
        contentView.addSubview(view1)
        view1.addSubview(icon1)
        view1.addSubview(headLabel1)
        view1.addSubview(bottomLabel1)
        view1.addSubview(arrowPointer1)
        contentView.addSubview(view2)
        view2.addSubview(icon2)
        view2.addSubview(headLabel2)
        view2.addSubview(bottomLabel2)
        view2.addSubview(arrowPointer2)
        contentView.addSubview(view3)
        view3.addSubview(icon3)
        view3.addSubview(headLabel3)
        view3.addSubview(bottomLabel3)
        view3.addSubview(arrowPointer3)
        contentView.addSubview(view4)
        view4.addSubview(icon4)
        view4.addSubview(headLabel4)
        view4.addSubview(bottomLabel4)
        view4.addSubview(arrowPointer4)
        contentView.addSubview(view5)
        view5.addSubview(icon5)
        view5.addSubview(headLabel5)
        view5.addSubview(bottomLabel5)
        view5.addSubview(arrowPointer5)
    }
    func constraintViews() {
        addDefaultViews()
        scrollView.backgroundColor = AppColors.profileWhite.color
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 28),
            backButton.widthAnchor.constraint(equalToConstant: 28),

            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 25),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            meditationTopView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            meditationTopView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            meditationTopView.widthAnchor.constraint(equalToConstant: 330),
            meditationTopView.heightAnchor.constraint(equalToConstant: 198),

            sleepBetterLabel.topAnchor.constraint(equalTo: meditationTopView.topAnchor, constant: 36),
            sleepBetterLabel.leadingAnchor.constraint(equalTo: meditationTopView.leadingAnchor, constant: 15),

            timeLabel.topAnchor.constraint(equalTo: sleepBetterLabel.bottomAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: sleepBetterLabel.leadingAnchor),

            playButton.topAnchor.constraint(equalTo: sleepBetterLabel.bottomAnchor, constant: 60),
            playButton.leadingAnchor.constraint(equalTo: sleepBetterLabel.leadingAnchor),

            sleepBetterImage.bottomAnchor.constraint(equalTo: meditationTopView.bottomAnchor, constant: 0),
            sleepBetterImage.trailingAnchor.constraint(equalTo: meditationTopView.trailingAnchor, constant: 0),

            sessionLabel.topAnchor.constraint(equalTo: meditationTopView.bottomAnchor, constant: 60),
            sessionLabel.leadingAnchor.constraint(equalTo: meditationTopView.leadingAnchor),

            view1.leadingAnchor.constraint(equalTo: sessionLabel.leadingAnchor),
            view1.topAnchor.constraint(equalTo: sessionLabel.bottomAnchor, constant: 30),
            view1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            view1.heightAnchor.constraint(equalToConstant: 48),

            icon1.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            icon1.centerYAnchor.constraint(equalTo: view1.centerYAnchor),

            headLabel1.topAnchor.constraint(equalTo: view1.topAnchor, constant: 1.5),
            headLabel1.leadingAnchor.constraint(equalTo: icon1.trailingAnchor, constant: 20),

            bottomLabel1.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: 1.5),
            bottomLabel1.leadingAnchor.constraint(equalTo: headLabel1.leadingAnchor),

            arrowPointer1.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            arrowPointer1.trailingAnchor.constraint(equalTo: view1.trailingAnchor),

            view2.leadingAnchor.constraint(equalTo: sessionLabel.leadingAnchor),
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 30),
            view2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            view2.heightAnchor.constraint(equalToConstant: 48),

            icon2.leadingAnchor.constraint(equalTo: view2.leadingAnchor),
            icon2.centerYAnchor.constraint(equalTo: view2.centerYAnchor),

            headLabel2.topAnchor.constraint(equalTo: view2.topAnchor, constant: 1.5),
            headLabel2.leadingAnchor.constraint(equalTo: icon2.trailingAnchor, constant: 20),

            bottomLabel2.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: 1.5),
            bottomLabel2.leadingAnchor.constraint(equalTo: headLabel2.leadingAnchor),

            arrowPointer2.centerYAnchor.constraint(equalTo: view2.centerYAnchor),
            arrowPointer2.trailingAnchor.constraint(equalTo: view2.trailingAnchor),

            view3.leadingAnchor.constraint(equalTo: sessionLabel.leadingAnchor),
            view3.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 30),
            view3.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            view3.heightAnchor.constraint(equalToConstant: 48),

            icon3.leadingAnchor.constraint(equalTo: view3.leadingAnchor),
            icon3.centerYAnchor.constraint(equalTo: view3.centerYAnchor),

            headLabel3.topAnchor.constraint(equalTo: view3.topAnchor, constant: 1.5),
            headLabel3.leadingAnchor.constraint(equalTo: icon3.trailingAnchor, constant: 20),

            bottomLabel3.bottomAnchor.constraint(equalTo: view3.bottomAnchor, constant: 1.5),
            bottomLabel3.leadingAnchor.constraint(equalTo: headLabel3.leadingAnchor),

            arrowPointer3.centerYAnchor.constraint(equalTo: view3.centerYAnchor),
            arrowPointer3.trailingAnchor.constraint(equalTo: view3.trailingAnchor),

            view4.leadingAnchor.constraint(equalTo: sessionLabel.leadingAnchor),
            view4.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 30),
            view4.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            view4.heightAnchor.constraint(equalToConstant: 48),

            icon4.leadingAnchor.constraint(equalTo: view4.leadingAnchor),
            icon4.centerYAnchor.constraint(equalTo: view4.centerYAnchor),

            headLabel4.topAnchor.constraint(equalTo: view4.topAnchor, constant: 1.5),
            headLabel4.leadingAnchor.constraint(equalTo: icon4.trailingAnchor, constant: 20),

            bottomLabel4.bottomAnchor.constraint(equalTo: view4.bottomAnchor, constant: 1.5),
            bottomLabel4.leadingAnchor.constraint(equalTo: headLabel4.leadingAnchor),

            arrowPointer4.centerYAnchor.constraint(equalTo: view4.centerYAnchor),
            arrowPointer4.trailingAnchor.constraint(equalTo: view4.trailingAnchor),

            view5.leadingAnchor.constraint(equalTo: sessionLabel.leadingAnchor),
            view5.topAnchor.constraint(equalTo: view4.bottomAnchor, constant: 30),
            view5.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            view5.heightAnchor.constraint(equalToConstant: 48),
            view5.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            icon5.leadingAnchor.constraint(equalTo: view5.leadingAnchor),
            icon5.centerYAnchor.constraint(equalTo: view5.centerYAnchor),

            headLabel5.topAnchor.constraint(equalTo: view5.topAnchor, constant: 1.5),
            headLabel5.leadingAnchor.constraint(equalTo: icon5.trailingAnchor, constant: 20),

            bottomLabel5.bottomAnchor.constraint(equalTo: view5.bottomAnchor, constant: 1.5),
            bottomLabel5.leadingAnchor.constraint(equalTo: headLabel5.leadingAnchor),

            arrowPointer5.centerYAnchor.constraint(equalTo: view5.centerYAnchor),
            arrowPointer5.trailingAnchor.constraint(equalTo: view5.trailingAnchor)
        ])
    }
}
