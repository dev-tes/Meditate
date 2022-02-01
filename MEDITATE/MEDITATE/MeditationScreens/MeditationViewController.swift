//
//  MeditationViewController.swift
//  MEDITATE
//
//  Created by  Decagon on 12/10/2021.
//

import UIKit

class MeditationViewController: UIViewController {
    // MARK: - Properties
    let scrollView = UIScrollView()
    let contentView = UIView()
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    let meditationTopView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let sleepBetterLabel: UILabel = {
        let label = UILabel()
        label.text = "Sleep Better"
        label.font = UIFont(name: "Nunito Sans", size: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "35 min"
        label.font = UIFont(name: "Nunito Sans", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Play Button"), for: .normal)
        return button
    }()
    let sleepBetterImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MediatationIllustration")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let sessionLabel: UILabel = {
        let label = UILabel()
        label.text = "Sessions"
        label.font = UIFont(name: "Nunito Sans", size: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let view1: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let icon1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "timeIcon"), for: .normal)
        return button
    }()
    let headLabel1: UILabel = {
        let label = UILabel()
        label.text = "Sleep Better"
        label.font = UIFont(name: "Nunito Sans", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let bottomLabel1: UILabel = {
        let label = UILabel()
        label.text = "2 min / 5 min"
        label.font = UIFont(name: "Nunito Sans", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let arrowPointer1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moreDetails), for: .touchUpInside)
        button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
        return button
    }()
    let view2: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let icon2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "MScreenPlayButton"), for: .normal)
        return button
    }()
    let headLabel2: UILabel = {
        let label = UILabel()
        label.text = "Bad Dreams"
        label.font = UIFont(name: "Nunito Sans", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let bottomLabel2: UILabel = {
        let label = UILabel()
        label.text = "0 min / 10 min"
        label.font = UIFont(name: "Nunito Sans", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let arrowPointer2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
        return button
    }()
    let view3: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let icon3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "MScreenPlayButton"), for: .normal)
        return button
    }()
    let headLabel3: UILabel = {
        let label = UILabel()
        label.text = "Panic Attack"
        label.font = UIFont(name: "Nunito Sans", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let bottomLabel3: UILabel = {
        let label = UILabel()
        label.text = "0 min / 5 min"
        label.font = UIFont(name: "Nunito Sans", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let arrowPointer3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
        return button
    }()
    let view4: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let icon4: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "MScreenPlayButton"), for: .normal)
        return button
    }()
    let headLabel4: UILabel = {
        let label = UILabel()
        label.text = "Phone Addiction"
        label.font = UIFont(name: "Nunito Sans", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let bottomLabel4: UILabel = {
        let label = UILabel()
        label.text = "0 min / 15 min"
        label.font = UIFont(name: "Nunito Sans", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let arrowPointer4: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
        return button
    }()
    let view5: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let icon5: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "MScreenPlayButton"), for: .normal)
        return button
    }()
    let headLabel5: UILabel = {
        let label = UILabel()
        label.text = "Overthinking"
        label.font = UIFont(name: "Nunito Sans", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let bottomLabel5: UILabel = {
        let label = UILabel()
        label.text = "0 min / 5 min"
        label.font = UIFont(name: "Nunito Sans", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let arrowPointer5: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
        return button
    }()
    // MARK: - View LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.profileWhite.color
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        constraintViews()
    }
    // MARK: - Selectors
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    @objc func moreDetails() {
        navigationController?.pushViewController(MeditationSubViewController(), animated: true)
    }
}
