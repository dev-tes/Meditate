//
//  Home+Extension.swift
//  MEDITATE
//
//  Created by user on 06/10/2021.
//

import UIKit
// MARK: - EXTENSION
extension HomeViewController {
  // MARK: - FUNCTION
  func addDefaultViews() {
    view.addSubview(collectionView)
  }
  // MARK: - FUNCTION
  func constraintViews() {
    addDefaultViews()
    collectionView.anchorWithConstantsToTop(top: dashBoardLabel.topAnchor,
  left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 280, leftConstant: 30, bottomConstant: 300, rightConstant: 30)
  }
  // MARK: - COLLECTION VIEW
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cards.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let homeCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
    homeCell.layer.cornerRadius = 60
    homeCell.nextButtonIcon.addTarget(self, action: #selector(didTapArrowButton), for: .touchUpInside)
    let card = cards[indexPath.row]
    homeCell.card = card
    return homeCell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 200)
  }
    @objc func didTapArrowButton() {
        navigationController?.pushViewController(MeditationViewController(), animated: true)
    }
}
