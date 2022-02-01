//
//  PageCell.swift
//  Carbon
//
//  Created by  Decagon on 25/09/2021.
//

import UIKit

class PageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    // MARK: PROPERTIES
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
            let color = UIColor(white: 0.2, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title, attributes:
                                                            [NSAttributedString.Key.font: UIFont(name: "NunitoSans-Bold", size: 25)!, NSAttributedString.Key.foregroundColor: color])
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes:
                                                      [NSAttributedString.Key.font: UIFont(name: "NunitoSans-Regular", size: 17)!, NSAttributedString.Key.foregroundColor: color]))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            textView.attributedText = attributedText
            imageView.image = UIImage(named: page.imageName)
        }
    }
    let textView: UITextView = {
        let textv = UITextView()
        textv.text = "Sample for now"
        textv.isEditable = false
        textv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        textv.translatesAutoresizingMaskIntoConstraints = false
        return textv
    }()
    let imageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "onboardingScreenImage3")
        theImageView.contentMode = .scaleAspectFit
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    // MARK: SETTING CONSTRAINTS
    private func setupViews() {
        addSubview(textView)
        addSubview(imageView)
        imageView.anchorWithConstantsToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor, topConstant: 200, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        textView.anchorWithConstantsToTop(imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 20, rightConstant: 20)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
