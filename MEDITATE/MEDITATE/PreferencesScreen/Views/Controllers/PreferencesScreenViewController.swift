//
//  PreferencesScreenViewController.swift
//  MEDITATE
//
//  Created by User on 11/10/2021.
//

import UIKit

class PreferencesScreenViewController: UIViewController {
    private let navigationView: UIView = {
        let navView = UIView()
        //    Back button configuration
        let backButton: UIButton = {
            let backButtonImageView: UIImageView = {
                let backButtonImage = UIImageView()
                backButtonImage.translatesAutoresizingMaskIntoConstraints = false
                backButtonImage.image = UIImage(named: "Go Back Icon")
                backButtonImage.contentMode = .scaleAspectFit
                return backButtonImage
            }()
            let backButton = UIButton()
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.addSubview(backButtonImageView)
            backButtonImageView.frame = backButton.bounds
            backButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
            backButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
            backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
            return backButton
        }()
        //    Navigation text label configuration
        let navigationTextLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textAlignment = .center
            textLabel.font = UIFont(name: "NunitoSans-Bold", size: 22)
            textLabel.text = "Preferences"
            return textLabel
        }()
        navView.addSubview(backButton)
        navView.addSubview(navigationTextLabel)
        navigationTextLabel.topAnchor.constraint(equalTo: navView.topAnchor, constant: 59).isActive = true
        navigationTextLabel.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive =  true
        backButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 59).isActive = true
        backButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -20).isActive = true
        backButton.leftAnchor.constraint(equalTo: navView.leftAnchor, constant: 30).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 117).isActive = true
        navView.translatesAutoresizingMaskIntoConstraints = false
        return navView
    }()
    private let dataAnalysticsItemsView: UIView = {
        let dataAnalysticsView = UIView()
        let dataAnalyticsImageView: UIImageView = {
            let imageView = UIImageView()
         imageView.image = UIImage(named: "Icon-1")
         imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let dataAnalyticsTextLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textAlignment = .center
            textLabel.font = UIFont(name: "NunitoSans-Bold", size: 17)
            textLabel.text = "Data Analytics"
            return textLabel
        }()
        let dataAnalyticsSwitch: UISwitch = {
            let dataSwitch = UISwitch()
//            dataSwitch.thumbTintColor = .gray
            dataSwitch.onTintColor = .black
            dataSwitch.translatesAutoresizingMaskIntoConstraints = false
            return dataSwitch
        }()
        dataAnalysticsView.addSubview(dataAnalyticsTextLabel)
        dataAnalysticsView.addSubview(dataAnalyticsImageView)
        dataAnalysticsView.addSubview(dataAnalyticsSwitch)
        dataAnalysticsView.translatesAutoresizingMaskIntoConstraints = false
        dataAnalyticsImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        dataAnalyticsImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        dataAnalyticsImageView.topAnchor.constraint(equalTo: dataAnalysticsView.topAnchor, constant: 0).isActive = true
        dataAnalyticsImageView.leftAnchor.constraint(equalTo: dataAnalysticsView.leftAnchor, constant: 30).isActive = true
        dataAnalyticsTextLabel.topAnchor.constraint(equalTo: dataAnalysticsView.topAnchor, constant: 5).isActive = true
        dataAnalyticsTextLabel.leftAnchor.constraint(equalTo: dataAnalysticsView.leftAnchor, constant: 98).isActive = true
        dataAnalyticsSwitch.heightAnchor.constraint(equalToConstant: 31).isActive = true
        dataAnalyticsSwitch.widthAnchor.constraint(equalToConstant: 51).isActive = true
        dataAnalyticsSwitch.rightAnchor.constraint(equalTo: dataAnalysticsView.rightAnchor, constant: -30).isActive = true
        dataAnalyticsSwitch.topAnchor.constraint(equalTo: dataAnalysticsView.topAnchor, constant: 2).isActive = true
        return dataAnalysticsView
    }()
    private let newsLetterItemsView: UIView = {
        let newsLetterView = UIView()
        let newsLetterImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Small-1")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let newsLetterTextLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textAlignment = .center
            textLabel.font = UIFont(name: "NunitoSans-Bold", size: 17)
            textLabel.text = "Newsletters"
            return textLabel
        }()
        let newsLetterSwitch: UISwitch = {
            let dataSwitch = UISwitch()
            dataSwitch.onTintColor = .black
            dataSwitch.translatesAutoresizingMaskIntoConstraints = false
            return dataSwitch
        }()
        newsLetterView.addSubview(newsLetterTextLabel)
        newsLetterView.addSubview(newsLetterImageView)
        newsLetterView.addSubview(newsLetterSwitch)
        newsLetterView.translatesAutoresizingMaskIntoConstraints = false
        newsLetterImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        newsLetterImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        newsLetterImageView.topAnchor.constraint(equalTo: newsLetterView.topAnchor, constant: -10).isActive = true
        newsLetterImageView.leftAnchor.constraint(equalTo: newsLetterView.leftAnchor, constant: 30).isActive = true
        newsLetterTextLabel.topAnchor.constraint(equalTo: newsLetterView.topAnchor, constant: 5).isActive = true
        newsLetterTextLabel.leftAnchor.constraint(equalTo: newsLetterView.leftAnchor, constant: 98).isActive = true
        newsLetterSwitch.heightAnchor.constraint(equalToConstant: 31).isActive = true
        newsLetterSwitch.widthAnchor.constraint(equalToConstant: 51).isActive = true
        newsLetterSwitch.rightAnchor.constraint(equalTo: newsLetterView.rightAnchor, constant: -30).isActive = true
        newsLetterSwitch.topAnchor.constraint(equalTo: newsLetterView.topAnchor, constant: 2).isActive = true
        return newsLetterView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        doBasicSetUp()
        toConstraintTheView()
    }
    func doBasicSetUp() {
        view.addSubview(navigationView)
        view.addSubview(dataAnalysticsItemsView)
        view.addSubview(newsLetterItemsView)
    }
    func toConstraintTheView() {
        //    PAGE VIEW CONSTRAINT
        NSLayoutConstraint.activate([
            //  navigation view constraint
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            navigationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            navigationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            navigationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -710),
            dataAnalysticsItemsView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 10),
            dataAnalysticsItemsView.heightAnchor.constraint(equalToConstant: 48),
            dataAnalysticsItemsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            dataAnalysticsItemsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            newsLetterItemsView.topAnchor.constraint(equalTo: dataAnalysticsItemsView.bottomAnchor, constant: 40),
            newsLetterItemsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            newsLetterItemsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            newsLetterItemsView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
