//
//  MainViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 16.08.2022.
//

import UIKit

class MainViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: 40, left: 9, bottom: 10, right: 9)
        layout.itemSize = CGSize(width: (self.view.frame.width - 36) / 2 , height: (self.view.frame.width - 36) / 2)
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        setupUI()
        setupNavBar()
    }

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .gray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private func setupNavBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: 44))
        navBar.backgroundColor = .green
        view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Помощь")
        let closeItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: nil)
        navItem.leftBarButtonItem = closeItem
        navBar.setItems([navItem], animated: true)
    }
    private func setupUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize.init(width: view.frame.width, height: 250)
//        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
        cell.backgroundColor = .gray
        cell.categoryImageView.image = UIImage(named: "category-1")
        return cell
    }
    
    
}

