//
//  JobStress+Extension.swift
//  MEDITATE
//
//  Created by user on 06/10/2021.
//

import UIKit
// MARK: - EXTENSION
extension JobStressViewController {
  // MARK: - FUNCTION
  func addDefaultViews() {
    view.addSubview(collectionView)
  }
  // MARK: - FUNCTION
  func constraintViews() {
    addDefaultViews()
    collectionView.anchorWithConstantsToTop(top: view.topAnchor,
  left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 150, leftConstant: 30, bottomConstant: 80, rightConstant: 30)
  }
  // MARK: - COLLECTION VIEW
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cards.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? JobStressCollectionViewCell else { return UICollectionViewCell() }
    cell.layer.cornerRadius = 60
    let card = cards[indexPath.row]
    cell.card = card
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 200)
  }
}
