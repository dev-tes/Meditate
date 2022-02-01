//
//  TotalMeditationViewController.swift
//  MEDITATE
//
//  Created by  Decagon on 05/10/2021.
//

import UIKit

class TotalMeditationViewController: UIViewController {
    let topBackArrowButton: UIButton = {
      let button = UIButton()
      button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setBackgroundImage(UIImage(named: "Go Back Icon"), for: .normal)
      return button
    }()
    let pageTitleLabel: UILabel = {
      let label = UILabel()
      label.text = "Total Meditation"
      label.numberOfLines = 2
      label.font = UIFont(name: "Nunito Sans", size: 20)
      label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
      label.textAlignment = .center
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
        button.setBackgroundImage(UIImage(named: "Meditation-Full-Icon"), for: .normal)
        button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
        return button
    }()
    let totalMeditationTimerLabel: UILabel = {
      let label = UILabel()
      label.text = "120 hours"
      label.font = UIFont(name: "Nunito Sans", size: 16)
      label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let totalMeditationTextLabel: UILabel = {
      let label = UILabel()
      label.text = "You have spent meditating in total \n using our app"
      label.numberOfLines = 2
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 12, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let totalTimeSectionLabel: UILabel = {
      let label = UILabel()
      label.text = "Total Time"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let totalMeditationTimeLabel: UILabel = {
      let label = UILabel()
      label.text = "72 hours"
      label.font = UIFont(name: "Nunito Sans", size: 18)
      label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let meditationDurationLabel: UILabel = {
      let label = UILabel()
      label.text = "Apr 27 - May 03"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let mondayLabel: UILabel = {
      let label = UILabel()
      label.text = "M"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let tuesdayLabel: UILabel = {
      let label = UILabel()
      label.text = "T"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let wednesdayLabel: UILabel = {
      let label = UILabel()
      label.text = "W"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let thursdayLabel: UILabel = {
      let label = UILabel()
      label.text = "T"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let fridayLabel: UILabel = {
      let label = UILabel()
      label.text = "F"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let saturdayLabel: UILabel = {
      let label = UILabel()
      label.text = "S"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let sundayLabel: UILabel = {
      let label = UILabel()
      label.text = "S"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 14, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let graphView: UIView = {
      let view = UIView()
      view.backgroundColor = AppColors.gray.color
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let mondayView: UIView = {
      let view = UIView()
      view.backgroundColor = .black
        view.layer.cornerRadius = 7
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let tuesdayView: UIView = {
      let view = UIView()
      view.backgroundColor = .black
        view.layer.cornerRadius = 7
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let wednesdayView: UIView = {
      let view = UIView()
      view.backgroundColor = .black
        view.layer.cornerRadius = 7
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let thursdayView: UIView = {
      let view = UIView()
      view.backgroundColor = .black
        view.layer.cornerRadius = 7
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let fridayView: UIView = {
      let view = UIView()
      view.backgroundColor = .black
        view.layer.cornerRadius = 7
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let saturdayView: UIView = {
      let view = UIView()
      view.backgroundColor = .black
        view.layer.cornerRadius = 7
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let sundayView: UIView = {
      let view = UIView()
      view.backgroundColor = .black
        view.layer.cornerRadius = 7
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    let statisticsLabel: UILabel = {
      let label = UILabel()
      label.text = "Statistics"
      label.font = UIFont(name: "Nunito Sans", size: 20)
      label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let stressLabel: UILabel = {
      let label = UILabel()
      label.text = "Stress Level"
      label.font = UIFont(name: "Nunito Sans", size: 20)
      label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let happinessLabel: UILabel = {
      let label = UILabel()
      label.text = "Happiness Level"
      label.font = UIFont(name: "Nunito Sans", size: 20)
      label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let increaseStressLevelIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "IncreaseHappiness"), for: .normal)
        button.addTarget(self, action: #selector(didTapHappinessLevelButton), for: .touchUpInside)
        return button
    }()
    let decreaseStressLevelIcon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "DecreaseStress"), for: .normal)
        button.addTarget(self, action: #selector(didTapStressLevelButton), for: .touchUpInside)
        return button
    }()
    let decreaseStressLevelLabel: UILabel = {
      let label = UILabel()
      label.text = "45% decrease"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 12, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let increaseHappinessLevelLabel: UILabel = {
      let label = UILabel()
      label.text = "78% increase"
      label.font = UIFont(name: "Nunito Sans", size: 12)
      label.font = UIFont.systemFont(ofSize: 12, weight: .light)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let decreaseStressForwardIcon: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setBackgroundImage(UIImage(named: "Go-Forward-1"), for: .normal)
      button.addTarget(self, action: #selector(didTapStressLevelButton), for: .touchUpInside)
      return button
    }()
    let increaseHappinessForwardIcon: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setBackgroundImage(UIImage(named: "Go-Forward-1"), for: .normal)
      button.addTarget(self, action: #selector(didTapHappinessLevelButton), for: .touchUpInside)
      return button
    }()
      override func viewDidLoad() {
          super.viewDidLoad()
        view.backgroundColor = AppColors.gray.color
        setupConstraintsTotalMeditation()
        self.tabBarController?.tabBar.isHidden = true
      }
}
