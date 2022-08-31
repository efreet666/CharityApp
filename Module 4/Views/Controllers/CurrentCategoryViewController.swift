//
//  CurrnetCategoryViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 28.08.2022.
//

import UIKit
import SnapKit

class CurrentCategoryViewController: UIViewController {

    
    var currentCategoryName: String?
    var currentCategoryId: String?
    var arrayOfCategoryNews: [EventModelElement] = []
  
    
    private enum Constants {
        static let cellHeight: CGFloat = 413
    }
    
    
    private lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainGreenColor
        setupTableView()
        configureNavBar()
        parseData()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func parseData() {
        
        let currentEvent = Bundle.main.decode(EventModel.self, from: DataPath.eventData)
    
        for el in currentEvent {
            guard let currentCategoryId = currentCategoryId else { return }
            
            let currentArrayCategory = el.category.flatMap { $0 } as! [String]
            
            if currentArrayCategory.contains(currentCategoryId) {
                arrayOfCategoryNews.append(el)
            }
        
        }
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
        self.navigationController?.title = currentCategoryName
        self.title = currentCategoryName
        self.tabBarController?.tabBar.backgroundColor = .whiteColor
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor
    }
}

extension CurrentCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCategoryNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryNewsTableViewCell.identifier, for: indexPath) as? CategoryNewsTableViewCell else { return UITableViewCell() }
        
        cell.setup(image: UIImage(named: "\(arrayOfCategoryNews[indexPath.row].images?.first ?? "")") ?? UIImage() , title: arrayOfCategoryNews[indexPath.row].title ?? "Error", subtitle: arrayOfCategoryNews[indexPath.row].subTitle ?? "Error", timeoutTitle: arrayOfCategoryNews[indexPath.row].timeout ?? "Error")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = EventDetailViewController()
        //push data
        vc.currentEventDetail = arrayOfCategoryNews[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
