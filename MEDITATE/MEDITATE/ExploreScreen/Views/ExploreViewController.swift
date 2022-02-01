//
//  ExploreViewController.swift
//  MEDITATE
//
//  Created by Decagon on 06/10/2021.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  private let titleImageView = UIImageView(image: UIImage(named: "FilterIcon"))
  private var exploreCollectionView: UICollectionView?
  // add exploreData to populate cells
  let exploreSectionData: [ExploreData] = {
    let anxiety = ExploreData(situationDescription: "Anxiety Problems", situationDuration: "20 min", situationImage: "Illustration-2")
    let sleep = ExploreData(situationDescription: "Sleep Better", situationDuration: "35 min", situationImage: "Illustration-1")
    let creative = ExploreData(situationDescription: "Creative Block", situationDuration: "20 min", situationImage: "Illustration-2")
    let stressful = ExploreData(situationDescription: "Stressful Times", situationDuration: "35 min", situationImage: "Illustration-1")
    return [anxiety, sleep, creative, stressful]
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupExploreTitle()
    setUpCollectionView()
  }
  // MARK: Create and constraint title and titleImage for explore screen
  private func setupExploreTitle() {
    title = "Explore"
    guard let navigationBar = self.navigationController?.navigationBar else { return }
    navigationBar.addSubview(titleImageView)
    titleImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleImageView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -25),
      titleImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -10),
      titleImageView.heightAnchor.constraint(equalToConstant: 25),
      titleImageView.widthAnchor.constraint(equalTo: titleImageView.heightAnchor)
    ])
  }
  // MARK: Create collectionView layout and attributes
  func setUpCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: view.frame.size.width*0.9, height: 200)
    layout.minimumLineSpacing = 30
    exploreCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    guard let exploreCollectionView = exploreCollectionView else { return }
    exploreCollectionView.layer.cornerRadius = 20
    exploreCollectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: ExploreCollectionViewCell.identifier)
    exploreCollectionView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    exploreCollectionView.frame = view.bounds
    exploreCollectionView.dataSource = self
    exploreCollectionView.delegate = self
    view.addSubview(exploreCollectionView)
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    exploreSectionData.count  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCollectionViewCell.identifier, for: indexPath) as? ExploreCollectionViewCell else { return UICollectionViewCell() }
    cell.layer.cornerRadius = 20
    cell.backgroundColor = .white
    cell.exploreData = exploreSectionData[indexPath.row]
    return cell
  }
}
