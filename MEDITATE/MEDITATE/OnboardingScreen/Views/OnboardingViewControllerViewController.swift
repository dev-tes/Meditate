//
//  ViewController.swift
//  MEDITATE
//
//  Created by FOLAHANMI KOLAWOLE on 23/09/2021.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: PROPERTIES
    let cellId = "cellId"
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .white
        collView.dataSource = self
        collView.delegate = self
        collView.showsHorizontalScrollIndicator = false
        collView.translatesAutoresizingMaskIntoConstraints = false
        return collView
    }()
    let pages: [Page] = {
        let firstPage = Page(title: "Reduce Stress", message: "We are here to help you get rid \n of the stress you might have", imageName: "onboardingScreenImage1")
        let secondPage = Page(title: "Constant Support", message: "We are always here to support \n you no matter what", imageName: "onboardingScreenImage2")
        let thirdPage = Page(title: "Stay Energized", message: "Our app will help you stay \n energized all the time", imageName: "onboardingScreenImage3")
        return [firstPage, secondPage, thirdPage]
    }()
    let nextArrow: UIButton = {
        let nextButton = UIButton()
        nextButton.setImage(UIImage(named: "forwardButton"), for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        return nextButton
    }()
    lazy var pageControl: UIPageControl = {
        let pageCont = UIPageControl()
        pageCont.pageIndicatorTintColor = .lightGray
        pageCont.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        pageCont.numberOfPages = pages.count
        return pageCont
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}
