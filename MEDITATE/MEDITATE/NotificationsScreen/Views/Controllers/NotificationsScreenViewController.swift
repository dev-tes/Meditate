//
//  NotificationsScreenViewController.swift
//  MEDITATE
//
//  Created by User on 11/10/2021.
//

import UIKit

class NotificationsScreenViewController: UIViewController {
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
            textLabel.text = "Notifications"
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
    private let pushAlertItemsView: UIView = {
        let pushAlertView = UIView()
        let pushAlertImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Icon-2")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let pushAlertTextLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textAlignment = .center
            textLabel.font = UIFont(name: "NunitoSans-Bold", size: 17)
            textLabel.text = "Push Alerts"
            return textLabel
        }()
        let pushAlertSwitch: UISwitch = {
            let switcher = UISwitch()
            switcher.onTintColor = .black
            switcher.translatesAutoresizingMaskIntoConstraints = false
            return switcher
        }()
        pushAlertView.addSubview(pushAlertTextLabel)
        pushAlertView.addSubview(pushAlertImageView)
        pushAlertView.addSubview(pushAlertSwitch)
        pushAlertView.translatesAutoresizingMaskIntoConstraints = false
    pushAlertImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
    pushAlertImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    pushAlertImageView.topAnchor.constraint(equalTo: pushAlertView.topAnchor, constant: -10).isActive = true
    pushAlertImageView.leftAnchor.constraint(equalTo: pushAlertView.leftAnchor, constant: 30).isActive = true
    pushAlertTextLabel.topAnchor.constraint(equalTo: pushAlertView.topAnchor, constant: 5).isActive = true
    pushAlertTextLabel.leftAnchor.constraint(equalTo: pushAlertView.leftAnchor, constant: 98).isActive = true
    pushAlertSwitch.heightAnchor.constraint(equalToConstant: 31).isActive = true
    pushAlertSwitch.widthAnchor.constraint(equalToConstant: 51).isActive = true
    pushAlertSwitch.rightAnchor.constraint(equalTo: pushAlertView.rightAnchor, constant: -30).isActive = true
    pushAlertSwitch.topAnchor.constraint(equalTo: pushAlertView.topAnchor, constant: 2).isActive = true
        return pushAlertView
    }()
    private let dailyAlertItemsView: UIView = {
        let dailyAlertView = UIView()
        let dailyAlertImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Small-3")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let dailyAlertTextLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textAlignment = .center
            textLabel.font = UIFont(name: "NunitoSans-Bold", size: 17)
            textLabel.text = "Daily Alerts"
            return textLabel
        }()
        let dailyAlertSwitch: UISwitch = {
            let dataSwitch = UISwitch()
            dataSwitch.onTintColor = .black
            dataSwitch.translatesAutoresizingMaskIntoConstraints = false
            return dataSwitch
        }()
        dailyAlertView.addSubview(dailyAlertTextLabel)
        dailyAlertView.addSubview(dailyAlertImageView)
        dailyAlertView.addSubview(dailyAlertSwitch)
        dailyAlertView.translatesAutoresizingMaskIntoConstraints = false
        dailyAlertImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        dailyAlertImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        dailyAlertImageView.topAnchor.constraint(equalTo: dailyAlertView.topAnchor, constant: -10).isActive = true
        dailyAlertImageView.leftAnchor.constraint(equalTo: dailyAlertView.leftAnchor, constant: 30).isActive = true
        dailyAlertTextLabel.topAnchor.constraint(equalTo: dailyAlertView.topAnchor, constant: 5).isActive = true
        dailyAlertTextLabel.leftAnchor.constraint(equalTo: dailyAlertView.leftAnchor, constant: 98).isActive = true
        dailyAlertSwitch.heightAnchor.constraint(equalToConstant: 31).isActive = true
        dailyAlertSwitch.widthAnchor.constraint(equalToConstant: 51).isActive = true
        dailyAlertSwitch.rightAnchor.constraint(equalTo: dailyAlertView.rightAnchor, constant: -30).isActive = true
        dailyAlertSwitch.topAnchor.constraint(equalTo: dailyAlertView.topAnchor, constant: 2).isActive = true
        return dailyAlertView
    }()
    private let promotionsItemsView: UIView = {
        let promotionsView = UIView()
        let promotionsImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Small-3")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let promotionsTextLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textAlignment = .center
            textLabel.font = UIFont(name: "NunitoSans-Bold", size: 17)
            textLabel.text = "Promotions"
            return textLabel
        }()
        let promotionsSwitch: UISwitch = {
            let dataSwitch = UISwitch()
            dataSwitch.onTintColor = .black
            dataSwitch.translatesAutoresizingMaskIntoConstraints = false
            return dataSwitch
        }()
        promotionsView.addSubview(promotionsTextLabel)
        promotionsView.addSubview(promotionsImageView)
        promotionsView.addSubview(promotionsSwitch)
        promotionsView.translatesAutoresizingMaskIntoConstraints = false
        promotionsImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        promotionsImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        promotionsImageView.topAnchor.constraint(equalTo: promotionsView.topAnchor, constant: -10).isActive = true
        promotionsImageView.leftAnchor.constraint(equalTo: promotionsView.leftAnchor, constant: 30).isActive = true
        promotionsTextLabel.topAnchor.constraint(equalTo: promotionsView.topAnchor, constant: 5).isActive = true
        promotionsTextLabel.leftAnchor.constraint(equalTo: promotionsView.leftAnchor, constant: 98).isActive = true
        promotionsSwitch.heightAnchor.constraint(equalToConstant: 31).isActive = true
        promotionsSwitch.widthAnchor.constraint(equalToConstant: 51).isActive = true
        promotionsSwitch.rightAnchor.constraint(equalTo: promotionsView.rightAnchor, constant: -30).isActive = true
        promotionsSwitch.topAnchor.constraint(equalTo: promotionsView.topAnchor, constant: 2).isActive = true
        return promotionsView
    }()
    private let chatAlertItemsView: UIView = {
        let chatAlertView = UIView()
        let chatAlertImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Small-2")
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let chatAlertTextLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textAlignment = .center
            textLabel.font = UIFont(name: "NunitoSans-Bold", size: 17)
            textLabel.text = "Promotions"
            return textLabel
        }()
        let chatAlertSwitch: UISwitch = {
            let dataSwitch = UISwitch()
            dataSwitch.onTintColor = .black
            dataSwitch.translatesAutoresizingMaskIntoConstraints = false
            return dataSwitch
        }()
        chatAlertView.addSubview(chatAlertTextLabel)
        chatAlertView.addSubview(chatAlertImageView)
        chatAlertView.addSubview(chatAlertSwitch)
        chatAlertView.translatesAutoresizingMaskIntoConstraints = false
        chatAlertImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        chatAlertImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        chatAlertImageView.topAnchor.constraint(equalTo: chatAlertView.topAnchor, constant: -10).isActive = true
        chatAlertImageView.leftAnchor.constraint(equalTo: chatAlertView.leftAnchor, constant: 30).isActive = true
        chatAlertTextLabel.topAnchor.constraint(equalTo: chatAlertView.topAnchor, constant: 5).isActive = true
        chatAlertTextLabel.leftAnchor.constraint(equalTo: chatAlertView.leftAnchor, constant: 98).isActive = true
        chatAlertSwitch.heightAnchor.constraint(equalToConstant: 31).isActive = true
        chatAlertSwitch.widthAnchor.constraint(equalToConstant: 51).isActive = true
        chatAlertSwitch.rightAnchor.constraint(equalTo: chatAlertView.rightAnchor, constant: -30).isActive = true
        chatAlertSwitch.topAnchor.constraint(equalTo: chatAlertView.topAnchor, constant: 2).isActive = true
        return chatAlertView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        doBasicSetUp()
        toConstraintTheView()
    }
    func doBasicSetUp() {
        view.addSubview(navigationView)
        view.addSubview(pushAlertItemsView)
        view.addSubview(dailyAlertItemsView)
        view.addSubview(promotionsItemsView)
        view.addSubview(chatAlertItemsView)
    }
    func toConstraintTheView() {
        //    PAGE VIEW CONSTRAINT
        NSLayoutConstraint.activate([
            //  navigation view constraint
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            navigationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            navigationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            navigationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -710),
            pushAlertItemsView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 10),
            pushAlertItemsView.heightAnchor.constraint(equalToConstant: 48),
            pushAlertItemsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            pushAlertItemsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            dailyAlertItemsView.topAnchor.constraint(equalTo: pushAlertItemsView.bottomAnchor, constant: 30),
            dailyAlertItemsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            dailyAlertItemsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            dailyAlertItemsView.heightAnchor.constraint(equalToConstant: 48),
            promotionsItemsView.topAnchor.constraint(equalTo: dailyAlertItemsView.bottomAnchor, constant: 30),
            promotionsItemsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            promotionsItemsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            promotionsItemsView.heightAnchor.constraint(equalToConstant: 48),
            chatAlertItemsView.topAnchor.constraint(equalTo: promotionsItemsView.bottomAnchor, constant: 30),
            chatAlertItemsView.leftAnchor.constraint(equalTo: view.leftAnchor),
            chatAlertItemsView.rightAnchor.constraint(equalTo: view.rightAnchor),
            chatAlertItemsView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
