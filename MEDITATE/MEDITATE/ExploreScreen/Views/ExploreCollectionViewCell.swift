//
//  ExploreCollectionViewCell.swift
//  MEDITATE
//
//  Created by Decagon on 06/10/2021.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
  // collection view cell Identifier
static var identifier = "ExploreCollectionViewCell"
  // populate cells views with exploreData
  var exploreData: ExploreData? {
    didSet {
      guard let exploreData = exploreData else { return }
      let exploreImage = exploreData.situationImage
      sessionImageView.image = UIImage(named: exploreImage)
      let title = exploreData.situationDescription
      sessionDescriptionLabel.text = title
      let duration =  exploreData.situationDuration
      sessionDurationLabel.text = duration
    }
  }
  // MARK: Create collectionViewCell UIViews
  let sessionDescriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Anxiety Problems"
    label.font = UIFont(name: "NunitoSans-SemiBold", size: 19)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  let sessionDurationLabel: UILabel = {
    let label = UILabel()
    label.text = "20 mins"
    label.font = UIFont(name: "NunitoSans-Regular", size: 15)
    label.textColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  let sessionDetailButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(named: "Button"), for: .normal)
    return button
  }()
  let sessionImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "Illustration")
    return imageView
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    // Add UIViews to contentView
    contentView.addSubview(sessionDescriptionLabel)
    contentView.addSubview(sessionDurationLabel)
    contentView.addSubview(sessionDetailButton)
    contentView.addSubview(sessionImageView)
    setUpExploreCellViews()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func setUpExploreCellViews() {
    NSLayoutConstraint.activate([
      // explore descriptionLabel constraints
      sessionDescriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
      sessionDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      sessionDescriptionLabel.heightAnchor.constraint(equalToConstant: 25),
      // explore durationLabel constraints
      sessionDurationLabel.topAnchor.constraint(equalTo: sessionDescriptionLabel.bottomAnchor, constant: 10),
      sessionDurationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      sessionDurationLabel.heightAnchor.constraint(equalToConstant: 20),
      // explore detailButton constraints
      sessionDetailButton.topAnchor.constraint(equalTo: sessionDurationLabel.bottomAnchor, constant: 25),
      sessionDetailButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      // explore imageView constraints
      sessionImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
      sessionImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
  }
}
