//
//  CurrnetCategoryViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 28.08.2022.
//

import UIKit
import SnapKit

final class CurrentCategoryViewController: UIViewController {
    
    var currentCategoryTitle: String?
    var currentCategoryId: String = ""
    
    private var categoryNewsArray: EventModel = []
    
    private enum Constants {
        static let cellHeight: CGFloat = 413
    }
    
    private lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var activityView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainGreenColor
        setupTableView()
        configureNavBar()
        showActivityIndicator()
  
        setupData()
    }
    
    func setupData() {
        DispatchQueue.global(qos: .userInitiated).sync {
            
            // MARK: - Get data
            self.categoryNewsArray = DataService.getEvents(currentCategoryId: currentCategoryId)
            
            DispatchQueue.main.async {
                self.activityView.stopAnimating()
                self.newsTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    // MARK: - Show activity view
    private func showActivityIndicator() {
        self.activityView = Spinner.activityIndicator(style: .large,
                                                      center: self.view.center)
        self.view.addSubview(self.activityView)
        self.activityView.startAnimating()
    }
    
    private func setupTableView() {
        newsTableView.backgroundColor = UIColor.lightGreyColor
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.register(CategoryNewsTableViewCell.self, forCellReuseIdentifier: CategoryNewsTableViewCell.identifier)
        
        view.addSubview(newsTableView)
        newsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(54)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(54)
        }
    }
    
    private func configureNavBar() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.mainGreenColor
        self.navigationController?.navigationBar.barTintColor = UIColor.mainGreenColor
        self.navigationController?.title = currentCategoryTitle
        self.title = currentCategoryTitle
        self.tabBarController?.tabBar.backgroundColor = .whiteColor
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension CurrentCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryNewsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryNewsTableViewCell.identifier, for: indexPath) as? CategoryNewsTableViewCell else { return UITableViewCell() }
        
        cell.setup(image: UIImage(named: "\(categoryNewsArray[indexPath.row].images?.first ?? "")") ?? UIImage() , title: categoryNewsArray[indexPath.row].title ?? "error", subtitle: categoryNewsArray[indexPath.row].subTitle ?? "", timeoutTitle: categoryNewsArray[indexPath.row].timeout ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EventDetailViewController(currentEventDetail: categoryNewsArray[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
