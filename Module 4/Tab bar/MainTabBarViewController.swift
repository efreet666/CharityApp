//
//  MainTabBarViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 16.08.2022.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private let greenColor = UIColor(red: 102/255, green: 166/255, blue: 54/255, alpha: 1)
    private let centerButtonDiameter: CGFloat = 42

    private lazy var centerButton: UIButton = {
        let centerButton = UIButton()
        centerButton.layer.cornerRadius = centerButtonDiameter / 2
        centerButton.backgroundColor = greenColor
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        return centerButton
    }()
    
    private lazy var heartImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(systemName: "heart.fill")
        heartImageView.tintColor = .white
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()
    
    private func setupUI() {
        tabBar.tintColor = greenColor
        //MARK: - add subview
        tabBar.addSubview(centerButton)
        centerButton.addSubview(heartImageView)

        //MARK: - activate center button contsraints
        NSLayoutConstraint.activate([
            // 2.1
            centerButton.heightAnchor.constraint(equalToConstant: centerButtonDiameter),
            centerButton.widthAnchor.constraint(equalToConstant: centerButtonDiameter),
            // 2.2
            centerButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            centerButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10)
        ])

        //MARK: - activate heart image constraints
        NSLayoutConstraint.activate([
            // 3.1
            heartImageView.heightAnchor.constraint(equalToConstant: 15),
            heartImageView.widthAnchor.constraint(equalToConstant: 18),
            // 3.2
            heartImageView.centerXAnchor.constraint(equalTo: centerButton.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: centerButton.centerYAnchor)
        ])
        
        
        let newsVC = UIViewController()
        newsVC.view.backgroundColor = .yellow
        newsVC.tabBarItem.title = "Новости"
        newsVC.tabBarItem.image = UIImage(systemName: "list.bullet")

        let searchVC = UIViewController()
        searchVC.view.backgroundColor = .green
        searchVC.tabBarItem.title = "Поиск"
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let helpVC = MainViewController()
        helpVC.tabBarItem.title = "Помочь"

        let historyVC = UIViewController()
        historyVC.view.backgroundColor = .blue
        historyVC.tabBarItem.title = "История"
        historyVC.tabBarItem.image = UIImage(systemName: "clock.arrow.2.circlepath")
        
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .blue
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        
        let controllers = [newsVC, searchVC, helpVC, historyVC, profileVC]
        tabBarController?.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        
    }
}
