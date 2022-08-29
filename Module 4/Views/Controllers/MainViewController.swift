//
//  MainViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 16.08.2022.
//

import UIKit
import Rswift

final class MainViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .gray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.backgroundColor = UIColor.whiteColor
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainGreenColor
        setupCollectionView()
        //setupNavBar()
        self.title = "Help"
    }
    
    // MARK: - set light status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    // MARK: - setup collectionView
    private func setupCollectionView() {

        // MARK: - collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 9, bottom: 9, right: 9)
        layout.itemSize = CGSize(width: (self.view.frame.width - 28) / 2, height: 160)
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 84, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: layout)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        view.addSubview(collectionView)
    }

    // MARK: - setup navigation bar
    private func setupNavBar() {

        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: 44))

        // MARK: - NavigationBarAppearance
        if #available(iOS 13.0, *) {

            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.whiteColor]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.whiteColor]
            navBarAppearance.backgroundColor = UIColor.mainGreenColor
            navBar.standardAppearance = navBarAppearance
            navBar.scrollEdgeAppearance = navBarAppearance
            let attributes = [NSAttributedString.Key.font: R.font.officinaSansExtraBoldC(size: 21)]
            navBarAppearance.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
        }

        view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: R.string.localizable.helpTitle())
        let closeItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(popVC))
        closeItem.tintColor = .white
        navItem.leftBarButtonItem = closeItem
        navBar.setItems([navItem], animated: true)
    }

    // MARK: - back button
    @objc func popVC() {
        print("Button tapped")
        // close application
        exit(-1)
    }
}

// Mark: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = UIColor.lightGreyColor
        cell.setup(image: categoryData[indexPath.row].image ?? UIImage() , text: categoryData[indexPath.row].text)
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell №\(indexPath.row + 1) tapped")
        
        let vc = CurrentCategoryViewController()
        vc.currentCategoryName = categoryData[indexPath.row].text
        
        self.hidesBottomBarWhenPushed = false
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                           withReuseIdentifier: HeaderCollectionReusableView.identifier,
                                                                           for: indexPath) as? HeaderCollectionReusableView else  { return UICollectionReusableView()}
        // MARK: - configure header
        header.configure()
        return header
    }
    
}
    
// Mark: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 57)
    }
}
