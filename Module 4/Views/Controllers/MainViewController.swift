//
//  MainViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 16.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var chooseCategoryLabel: UILabel = {
        let chooseCategoryLabel = UILabel()
        chooseCategoryLabel.text = "Выберите категорию помощи"
        chooseCategoryLabel.textColor = UIColor(red: 73/255, green: 74/255, blue: 74/255, alpha: 1)
        chooseCategoryLabel.textAlignment = .center
        chooseCategoryLabel.font = UIFont(name: "", size: 17)
        chooseCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        return chooseCategoryLabel
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .gray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 90, left: 9, bottom: 9, right: 9)
        layout.itemSize = CGSize(width: (self.view.frame.width - 28) / 2 , height: 160)
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        setupUI()
        setupNavBar()
    }
    
    
    private func setupNavBar() {
        let greenColor = UIColor(red: 102/255, green: 166/255, blue: 54/255, alpha: 1)
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: 44))
        
        if #available(iOS 13.0, *) {
            
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = greenColor
            navBar.standardAppearance = navBarAppearance
            navBar.scrollEdgeAppearance = navBarAppearance
        }
        
        view.addSubview(navBar)
        
        let navItem = UINavigationItem(title: "Помощь")
        let closeItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(popVC))
        closeItem.tintColor = .white
        navItem.leftBarButtonItem = closeItem
        navBar.setItems([navItem], animated: true)
    }
    
    private func setupUI() {
        
        view.addSubview(collectionView)
        view.addSubview(chooseCategoryLabel)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            chooseCategoryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            chooseCategoryLabel.heightAnchor.constraint(equalToConstant: 20),
            chooseCategoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            chooseCategoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    @objc func popVC() {
        print("Button tapped")
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
        cell.backgroundColor = UIColor(red: 234/255, green: 237/255, blue: 232/255, alpha: 1)
        cell.setup(image: categoryData[indexPath.row].image!, text:  categoryData[indexPath.row].text)
        return cell
    }
    
    
}

