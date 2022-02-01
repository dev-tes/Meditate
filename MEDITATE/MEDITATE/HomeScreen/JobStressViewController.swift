//
//  JobStressViewController.swift
//  MEDITATE
//
//  Created by user on 06/10/2021.
//

import  UIKit
class JobStressViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  // MARK: - VARIABLE TO HOLD ALL CARD IN AN ARRAY
  let cards: [PictureCard] = {
    let firstCard = PictureCard(title: "Meditation Break", time: "10 mins", imageName: "HomeScreenIllustration")
    let secondCard = PictureCard(title: "Deep Breathing", time: "25 mins", imageName: "HomeScreenIllustration2")
    let thirdCard = PictureCard(title: "Stressful Times", time: "45 mins", imageName: "HomeScreenIllustration3")
    return [firstCard, secondCard, thirdCard]
  }()
  let backImage: UIButton = {
    let backImage = UIButton()
    backImage.setImage(UIImage(named: "Go Back Icon"), for: .normal)
    backImage.translatesAutoresizingMaskIntoConstraints = false
    backImage.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    return backImage
  }()
  let jobTitleLabel: UILabel = {
    let textLabel = UILabel()
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    textLabel.textAlignment = .center
    textLabel.numberOfLines = 1
    textLabel.font = UIFont(name: "NunitoSans-Bold", size: 17)
    textLabel.text = "Job Stress"
    return textLabel
  }()
  @objc func didTapBackButton () {
     navigationController?.popViewController(animated: true)
  }
  // MARK: - COLLECTION VIEW
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 45
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  let cellIdentifier = "cellIdentifier"
  // MARK: - VIEW DID LOAD
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.register(JobStressCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    constraintViews()
    viewConstraint()
    collectionView.showsVerticalScrollIndicator = false
    self.navigationController?.isNavigationBarHidden = true
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    navigationItem.hidesBackButton = true
    self.tabBarController?.tabBar.isHidden = true
  }
  func viewConstraint() {
    view.addSubview(backImage)
    view.addSubview(jobTitleLabel)
    NSLayoutConstraint.activate([
      backImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
      backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      jobTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 96),
      jobTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -96),
      jobTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90)
    ])
  }
}
