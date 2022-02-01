//
//  OnboardingVCExtension.swift
//  MEDITATE
//
//  Created by  Decagon on 25/09/2021.
//

import UIKit

extension OnboardingViewController {
    // MARK: METHODS
    func setupViews() {
        displaySkipNavBarItem()
        setupConstraints()
        view.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
    private func displaySkipNavBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(didTapSkip))
    }
    private func goBackArrowButton() {
        let backItem = UIBarButtonItem()
        backItem.image = UIImage(named: "Go Back Icon")
        backItem.style = .plain
        backItem.tintColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
        backItem.target = self
        backItem.action = #selector(didTapBack)
        navigationItem.leftBarButtonItem = backItem
        navigationItem.rightBarButtonItem = nil
    }
    private func goToNextPage() {
        let nextIndex = pageControl.currentPage + 1
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    @objc func didTapSkip() {
        UserDefaults.standard.setValue(true, forKey: "onboarded")
        let signupViewController = SignUpEmailViewController()
        navigationController?.pushViewController(signupViewController, animated: true)
    }
    @objc func didTapBack() {
        if pageControl.currentPage == 1 {
            displaySkipNavBarItem()
            navigationItem.leftBarButtonItem = nil
        }
        let nextIndex = pageControl.currentPage - 1
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    @objc func nextButtonClicked() {
        if pageControl.currentPage == pages.count - 1 {
            goBackArrowButton()
            didTapSkip()
        } else if pageControl.currentPage == pages.count - 3 {
            goBackArrowButton()
            goToNextPage()
        } else {
            goToNextPage()
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        print(pageControl.currentPage)
        if pageNumber == 0 {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(didTapSkip))
            self.navigationItem.leftBarButtonItem = nil
        }
        if pageNumber != 0 {
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Go Back Icon"),
                                                                    style: .plain, target: self, action: #selector(didTapBack))
        }
    }
    // MARK: - Setting Constraints
    private func setupConstraints() {
        view.addSubview(nextArrow)
        view.addSubview(collectionView)
        collectionView.anchorWithConstantsToTop(view.safeAreaLayoutGuide.topAnchor,
                                                left: view.leftAnchor, bottom: nextArrow.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 30, rightConstant: 0)
        NSLayoutConstraint.activate([
            nextArrow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            nextArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextArrow.heightAnchor.constraint(equalToConstant: 64),
          nextArrow.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
    // MARK: - DataSource, Delegate and FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PageCell else { return UICollectionViewCell() }
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
}
