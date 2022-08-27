//
//  MainTabBarViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 16.08.2022.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    
    private enum Constants {
        static let heartImageViewHeight: CGFloat = 15
        static let centerButtonDiameter: CGFloat = 42
    }

    private lazy var centerButton: UIButton = {
        let centerButton = UIButton()
        centerButton.layer.cornerRadius = Constants.centerButtonDiameter / 2
        centerButton.backgroundColor = mainGreenColor

    private enum Constants {
        static let heartImageViewHeight: CGFloat = 15
        static let centerButtonDiameter: CGFloat = 42
        static let centerButtonTopAnchorConstant: CGFloat = -10
        static let heartImageViewWidth: CGFloat = 18
    }

    private lazy var centerButton: UIButton = {
        let centerButton = UIButton()
        centerButton.layer.cornerRadius = Constants.centerButtonDiameter / 2
        centerButton.backgroundColor = UIColor.mainGreenColor

        centerButton.translatesAutoresizingMaskIntoConstraints = false
        centerButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
        return centerButton
    }()

    private lazy var heartImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(systemName: "heart.fill")
        heartImageView.tintColor = .white
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()

    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        tabBar.tintColor = UIColor.mainGreenColor

        // MARK: - add subview
        tabBar.addSubview(centerButton)
        centerButton.addSubview(heartImageView)

        // MARK: - activate center button contsraints
        NSLayoutConstraint.activate([
            centerButton.heightAnchor.constraint(equalToConstant: Constants.centerButtonDiameter),
            centerButton.widthAnchor.constraint(equalToConstant: Constants.centerButtonDiameter),
            centerButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            centerButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: Constants.centerButtonTopAnchorConstant)
        ])

        // MARK: - activate heart image constraints
        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: Constants.heartImageViewHeight),
            heartImageView.widthAnchor.constraint(equalToConstant: 18),

            heartImageView.heightAnchor.constraint(equalToConstant: Constants.heartImageViewHeight),
            heartImageView.widthAnchor.constraint(equalToConstant: Constants.heartImageViewWidth),
>>>>>>> Stashed changes
            heartImageView.centerXAnchor.constraint(equalTo: centerButton.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: centerButton.centerYAnchor)
        ])

        // MARK: - create VC
        let newsVC = UIViewController()
        newsVC.view.backgroundColor = .yellow
        newsVC.tabBarItem.title = R.string.localizable.newsTabCategory()
        newsVC.tabBarItem.setTitleTextAttributes([.font: R.font.sfuiTextRegular(size: 10) ?? UIFont()], for: .normal)
        newsVC.tabBarItem.image = UIImage(systemName: "list.bullet")

        let searchVC = UIViewController()
        searchVC.view.backgroundColor = .green
        searchVC.tabBarItem.title = R.string.localizable.searchTabCategory()
        searchVC.tabBarItem.setTitleTextAttributes([.font: R.font.sfuiTextRegular(size: 10) ?? UIFont()], for: .normal)
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")

        // MARK: - Main VC
        let helpVC = MainViewController()
        helpVC.tabBarItem.setTitleTextAttributes([.font: R.font.sfuiTextRegular(size: 10) ?? UIFont()], for: .normal)
        helpVC.tabBarItem.title = R.string.localizable.helpTabCategory()

        let historyVC = UIViewController()
        historyVC.view.backgroundColor = .blue
        historyVC.tabBarItem.setTitleTextAttributes([.font: R.font.sfuiTextRegular(size: 10) ?? UIFont()], for: .normal)
        historyVC.tabBarItem.title = R.string.localizable.historyTabCategory()
        historyVC.tabBarItem.image = UIImage(systemName: "clock.arrow.2.circlepath")

        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .blue
        profileVC.tabBarItem.title = R.string.localizable.profileTabCategory()
        profileVC.tabBarItem.setTitleTextAttributes([.font: R.font.sfuiTextRegular(size: 10)!], for: .normal)
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")

        viewControllers = [newsVC, searchVC, helpVC, historyVC, profileVC]
        self.selectedIndex = 2

    }
    @objc private func didPressMiddleButton() {
        selectedIndex = 2
        centerButton.backgroundColor = mainGreenColor
//        centerButton.backgroundColor = .mainGreenColor
    }

        selectedIndex = 2
        centerButton.backgroundColor = UIColor.mainGreenColor
    }


}
