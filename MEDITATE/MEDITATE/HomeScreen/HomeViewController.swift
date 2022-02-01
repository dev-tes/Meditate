//
//  HomeViewController.swift
//  MEDITATE
//
//  Created by user on 06/10/2021.
//
import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    let cards: [PictureCard] = {
        let firstCard = PictureCard(title: "Anxiety Problems", time: "20 mins", imageName: "Illustration")
        let secondCard = PictureCard(title: "Sleep Better", time: "35 mins", imageName: "Illustration-1")
        let thirdCard = PictureCard(title: "Creative Block", time: "15 mins", imageName: "Illustration3")
        return [firstCard, secondCard, thirdCard]
    }()
    // MARK: - COLLECTION VIEW
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 45
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    lazy var dashBoardLabel: UILabel = {
        let label = UILabel()
        label.text = "Dashboard"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .black
        return label
    }()
    let filterImage: UIButton = {
        let filterImage = UIButton()
        filterImage.setImage(UIImage(named: "FilterIcon"), for: .normal)
        filterImage.translatesAutoresizingMaskIntoConstraints = false
        return filterImage
    }()
    let recommendedLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.numberOfLines = 1
        title.font = UIFont(name: "NunitoSans-Bold", size: 19)
        title.text = "Recommended"
        title.textColor = .black
        //  title.backgroundColor = .red
        return title
    }()
    let categoryLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.numberOfLines = 1
        title.font = UIFont(name: "NunitoSans-Bold", size: 19)
        title.text = "Categories"
        title.textColor = .black
        // title.backgroundColor = .red
        return title
    }()
    let categoryJobStressLabelText: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.numberOfLines = 1
        title.font = UIFont(name: "NunitoSans-Bold", size: 19)
        title.text = "Job Stress"
        title.textColor = .black
        return title
    }()
    let categoryMindJournalLabelText: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.numberOfLines = 1
        title.font = UIFont(name: "NunitoSans-Bold", size: 19)
        title.text = "Mind Journal"
        title.textColor = .black
        return title
    }()
    let jobButton: UIButton = {
        let jobButtonImage = UIButton()
        jobButtonImage.translatesAutoresizingMaskIntoConstraints = false
        jobButtonImage.setImage(UIImage(named: "SuitCaseIcon"), for: .normal)
        jobButtonImage.contentMode = .scaleAspectFit
        jobButtonImage.addTarget(self, action: #selector(didTapJobButton), for: .touchUpInside)
        return jobButtonImage
    }()
    let mindButton: UIButton = {
        let mindButtonImage = UIButton()
        mindButtonImage.translatesAutoresizingMaskIntoConstraints = false
        mindButtonImage.setImage(UIImage(named: "BookIcon" ), for: .normal)
        mindButtonImage.contentMode = .scaleAspectFit
        mindButtonImage.addTarget(self, action: #selector(didTapMindButton), for: .touchUpInside)
        return mindButtonImage
    }()
    @objc func didTapJobButton() {
        let nextController = JobStressViewController()
        navigationController?.pushViewController(nextController, animated: true)
    }
   @objc func didTapMindButton() {
     let nextController = MindJournalViewController()
    navigationController?.pushViewController(nextController, animated: true)
  }
    private let navigationView: UIView = {
        let navView = UIView()
        //    Play button configuration
        let playButton: UIButton = {
            let playButtonImageView: UIImageView = {
                let playButtonImage = UIImageView()
                playButtonImage.translatesAutoresizingMaskIntoConstraints = false
                playButtonImage.image = UIImage(named: "homeScreenPlayAlertIcon")
                playButtonImage.contentMode = .scaleAspectFit
                return playButtonImage
            }()
            let playButton = UIButton()
            playButton.translatesAutoresizingMaskIntoConstraints = false
            playButton.addSubview(playButtonImageView)
            playButtonImageView.frame = playButton.bounds
            playButton.heightAnchor.constraint(equalToConstant: 68).isActive = true
            playButton.widthAnchor.constraint(equalToConstant: 68).isActive = true
            playButton.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
            return playButton
        }()
        //    Navigation text label configuration
        let playTitleLabel: UILabel = {
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textAlignment = .center
            textLabel.numberOfLines = 1
            textLabel.font = UIFont(name: "NunitoSans-Bold", size: 17)
            textLabel.text = "Daily Relaxation"
            return textLabel
        }()
        let playDescriptionLabel: UILabel = {
            let textSubLabel = UILabel()
            textSubLabel.translatesAutoresizingMaskIntoConstraints = false
            textSubLabel.textAlignment = .justified
            textSubLabel.numberOfLines = 2
            textSubLabel.font = UIFont(name: "Helvetica", size: 13)
            textSubLabel.text = "It is the right time to relax and get \nrid of all the stress"
            return textSubLabel
        }()
        navView.addSubview(playButton)
        navView.addSubview(playTitleLabel)
        navView.addSubview(playDescriptionLabel)
        // navView.backgroundColor = .yellow
        playTitleLabel.topAnchor.constraint(equalTo: navView.topAnchor, constant: 24).isActive = true
        playTitleLabel.leftAnchor.constraint(equalTo: playButton.rightAnchor, constant: 20).isActive = true
        playDescriptionLabel.topAnchor.constraint(equalTo: playTitleLabel.bottomAnchor, constant: 5).isActive = true
        playDescriptionLabel.leftAnchor.constraint(equalTo: playButton.rightAnchor, constant: 20).isActive = true
        playButton.leftAnchor.constraint(equalTo: navView.leftAnchor, constant: 15).isActive = true
        playButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: 26).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 117).isActive = true
        navView.translatesAutoresizingMaskIntoConstraints = false
        return navView
    }()
    @objc func didTapShareButton() {
        presentCustomAlertOnMainThread(title: "Time to Meditate", message: "We think is the time for you \n to do some meditation", buttonTitle: "Start Now", imageNamed: "homeScreenPlayAlertIcon", arrowBtn: true)
    }
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewConstraint()
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        constraintViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    func viewConstraint() {
        view.addSubview(navigationView)
        view.addSubview(dashBoardLabel)
        view.addSubview(filterImage)
        view.addSubview(recommendedLabel)
        view.addSubview(categoryLabel)
        view.addSubview(jobButton)
        view.addSubview(categoryJobStressLabelText)
        view.addSubview(categoryMindJournalLabelText)
        view.addSubview(mindButton)
        NSLayoutConstraint.activate([
            dashBoardLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 59),
            dashBoardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            dashBoardLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -203),
            filterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 62),
            filterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 317),
            filterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            navigationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            recommendedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -215),
            recommendedLabel.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 60),
            recommendedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -252),
            categoryLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -145),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            jobButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -306),
            jobButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            jobButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            mindButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -134),
            mindButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            // mindButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -45
            categoryJobStressLabelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -221),
            categoryJobStressLabelText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            categoryJobStressLabelText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoryMindJournalLabelText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            categoryMindJournalLabelText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60)
        ])
    }
}
extension UIView {
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0,
                                  leftConstant: CGFloat = 0,bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
}
