//
//  SettingsViewController.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//

import UIKit
import FirebaseAuth
class SettingsViewController: UIViewController {

    let settingsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont(name: "NunitoSans-Bold", size: 22)
        label.frame = CGRect(x: 0, y: 0, width: 183, height: 29)
        label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let settingsBackButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(goBackToProfileScreen), for: .touchUpInside)
        button.setImage(UIImage(named: "Go Back Icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //  Personal details view
    let personalDetailsView: UIView = {
        let view = UIView()
        let personalDetailsImage: UIImageView = {
            let imageView = UIImageView.makeSettingsImage()
            imageView.image = UIImage(named: "ProfileIconBlack")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let personalDetailsLabel: UILabel = {
            let label = UILabel.makeSettingslabel()
            label.text = "Personal Details"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let personalDetailsButton: UIButton = {
            let button = UIButton.makeSettingsButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(goToPersonalDetailScreen), for: .touchUpInside)
            return button
        }()
        view.addSubview(personalDetailsImage)
        view.addSubview(personalDetailsLabel)
        view.addSubview(personalDetailsButton)
        view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        personalDetailsImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        personalDetailsImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        personalDetailsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        personalDetailsLabel.leftAnchor.constraint(equalTo: personalDetailsImage.rightAnchor, constant: 20).isActive = true
        personalDetailsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        personalDetailsButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //  preference settings
    let preferenceView: UIView = {
        let view = UIView()
        let preferenceImage: UIImageView = {
            let imageView = UIImageView.makeSettingsImage()
            imageView.image = UIImage(named: "preference")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let preferenceLabel: UILabel = {
            let label = UILabel.makeSettingslabel()
            label.text = "Preferences"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let preferenceButton: UIButton = {
            let button = UIButton.makeSettingsButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(goToPreferenceScreen), for: .touchUpInside)
            return button
        }()
        view.addSubview(preferenceImage)
        view.addSubview(preferenceLabel)
        view.addSubview(preferenceButton)
        view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        preferenceImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        preferenceImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        preferenceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        preferenceLabel.leftAnchor.constraint(equalTo: preferenceImage.rightAnchor, constant: 20).isActive = true
        preferenceButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        preferenceButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //  Notification view
    let notificationsView: UIView = {
        let view = UIView()
        let notificationsImage: UIImageView = {
            let imageView = UIImageView.makeSettingsImage()
            imageView.image = UIImage(named: "notification")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let notificationsLabel: UILabel = {
            let label = UILabel.makeSettingslabel()
            label.text = "Notifications"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let notificationsButton: UIButton = {
            let button = UIButton.makeSettingsButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(goToNotificationScreen), for: .touchUpInside)
            return button
        }()
        view.addSubview(notificationsImage)
        view.addSubview(notificationsLabel)
        view.addSubview(notificationsButton)
        view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        notificationsImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        notificationsImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        notificationsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        notificationsLabel.leftAnchor.constraint(equalTo: notificationsImage.rightAnchor, constant: 20).isActive = true
        notificationsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        notificationsButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //  privacy policy view
    let privacyPolicyView: UIView = {
        let view = UIView()
        let privacyPolicyImage: UIImageView = {
            let imageView = UIImageView.makeSettingsImage()
            imageView.image = UIImage(named: "privacy")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let privacyPolicyLabel: UILabel = {
            let label = UILabel.makeSettingslabel()
            label.text = "Privacy Policy"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let privacyPolicyButton: UIButton = {
            let button = UIButton.makeSettingsButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(goToPrivacyPolicyScreen), for: .touchUpInside)
            return button
        }()
        view.addSubview(privacyPolicyImage)
        view.addSubview(privacyPolicyLabel)
        view.addSubview(privacyPolicyButton)
        view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        privacyPolicyImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        privacyPolicyImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        privacyPolicyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        privacyPolicyLabel.leftAnchor.constraint(equalTo: privacyPolicyImage.rightAnchor, constant: 20).isActive = true
        privacyPolicyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        privacyPolicyButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //  contact us view
    let contactUsView: UIView = {
        let view = UIView()
        let contactUsImage: UIImageView = {
            let imageView = UIImageView.makeSettingsImage()
            imageView.image = UIImage(named: "contactUs")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        let contactUsLabel: UILabel = {
            let label = UILabel.makeSettingslabel()
            label.text = "Contact Us"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let contactUsButton: UIButton = {
            let button = UIButton.makeSettingsButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(goToContactScreen), for: .touchUpInside)
            return button
        }()
        view.addSubview(contactUsImage)
        view.addSubview(contactUsLabel)
        view.addSubview(contactUsButton)
        view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        contactUsImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contactUsImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contactUsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        contactUsLabel.leftAnchor.constraint(equalTo: contactUsImage.rightAnchor, constant: 20).isActive = true
        contactUsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        contactUsButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //  logout view
    let logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(ValidationColor.activeButton.color, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.titleLabel!.font = UIFont(name: "NunitoSans-Bold", size: 17)
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return button
    }()
    let logoutImage: UIImageView = {
        let imageView = UIImageView.makeSettingsImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logout")
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        doBasicSetUp()
        setUpConstraint()
        layoutSettingsTitle()
        self.tabBarController?.tabBar.isHidden = true
    }
    // function to set up the views
    func doBasicSetUp() {
        view.addSubview(personalDetailsView)
        view.addSubview(preferenceView)
        view.addSubview(notificationsView)
        view.addSubview(privacyPolicyView)
        view.addSubview(contactUsView)
        view.addSubview(logoutImage)
        view.addSubview(logoutButton)
        view.addSubview(settingsTitleLabel)
        view.addSubview(settingsBackButton)
        
    }
    // Function to set up constraint
    func setUpConstraint() {
        let logoutStack = UIStackView(arrangedSubviews: [logoutImage, logoutButton])
        logoutStack.distribution = .equalSpacing
        logoutStack.spacing = 20
        logoutStack.axis = .horizontal
        logoutStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutStack)
        NSLayoutConstraint.activate([
            
            personalDetailsView.topAnchor.constraint(equalTo: settingsTitleLabel.bottomAnchor, constant: 30),
            personalDetailsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            personalDetailsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            //      preference constraints
            preferenceView.topAnchor.constraint(equalTo: personalDetailsView.bottomAnchor, constant: 30),
            preferenceView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            preferenceView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            //      notification settings constraint
            notificationsView.topAnchor.constraint(equalTo: preferenceView.bottomAnchor, constant: 30),
            notificationsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            notificationsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            //      privacy policy constraints
            privacyPolicyView.topAnchor.constraint(equalTo: notificationsView.bottomAnchor, constant: 30),
            privacyPolicyView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            privacyPolicyView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            //      contact us constraints
            contactUsView.topAnchor.constraint(equalTo: privacyPolicyView.bottomAnchor, constant: 30),
            contactUsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            contactUsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            //      logoutStack view constraints
            logoutStack.topAnchor.constraint(equalTo: contactUsView.bottomAnchor, constant: 30),
            logoutStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
        ])
    }
    func layoutSettingsTitle() {
        NSLayoutConstraint.activate([
            // personalDetailTitleLabel Constraints
            settingsTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            settingsTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // personalDetailBackButton Constraints
            settingsBackButton.topAnchor.constraint(equalTo: settingsTitleLabel.topAnchor),
            settingsBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
    }
    //  back button function
    @objc func goBackToProfileScreen() {
        if let tabBarController = HomeTabBarController() as? UITabBarController {
            tabBarController.selectedIndex = 2
            navigationController?.popViewController(animated: true)
            navigationController?.isNavigationBarHidden = true
        }
    }
    //  go to personal details screen function
    @objc func goToPersonalDetailScreen(){
        navigationController?.pushViewController(PersonalDetailViewController(), animated: true)
    }
    // go to preference screen
    @objc func goToPreferenceScreen() {
        let preferenceViewController = PreferencesScreenViewController()
        navigationController?.pushViewController(preferenceViewController, animated: true)
    }
    //  go to notification screen
    @objc func goToNotificationScreen() {
        let notificationViewController = NotificationsScreenViewController()
        navigationController?.pushViewController(notificationViewController, animated: true)
    }
    //  go to privacy policy screen
    @objc func goToPrivacyPolicyScreen() {
        let privacyPolicyViewController = PrivacyPolicyViewController()
        navigationController?.pushViewController(privacyPolicyViewController, animated: true)
    }
    //  go to contact us screen
    @objc func goToContactScreen() {
        let contactUsViewController = ContactUsViewController()
        navigationController?.pushViewController(contactUsViewController, animated: true)
    }
    //  go to logout
    @objc func logout() {
        presentCustomAlertOnMainThread(title: "Logout", message: "Are you really sure you want to logout now?", buttonTitle: "Confirm", imageNamed: "logout", arrowBtn: false)
        let auth = Auth.auth()
        do {
            try auth.signOut()
        } catch {
        }
    }
}
// UIview extension 
extension UIView {
    class func makeSettingslabel() -> UILabel {
        let label = UILabel()
        label.heightAnchor.constraint(equalToConstant: 48).isActive = true
        label.layer.borderWidth = 0
        label.font = UIFont(name: "NunitoSans-Bold", size: 17)
        return label
    }
    class func makeSettingsButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.setImage(UIImage(named: "Go-Forward-1"), for: .normal)
        return button
    }
    class func makeSettingsImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        return imageView
    }
}
