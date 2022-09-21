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
    
    private var categoryEvents = [Event]()
    private var categoryNewsArray: [EventModelElement] = []
    
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
        
        // MARK: - Check flag for using DB
        switch UsingDataBaseFlag.flag {
        case .coreData:
            CoreDataManager.saveEventData()
            
            DispatchQueue.global(qos: .userInitiated).async {
                self.categoryEvents = CoreDataManager.readEventData()
                self.convertToModel(eventDataCategories: self.categoryEvents)
            }
        case .Realm:
            DispatchQueue.global(qos: .userInitiated).async {
                RealmDataManager.saveEventData()
                self.convertRealmDataToModel()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    // MARK: - write Realm data
    private func convertRealmDataToModel() {
        let data = RealmDataManager.readEventData()
        var currentEventArray: [EventModelElement] = []
        
        // MARK: - create action buttons array
        data.forEach { currentEvent in
            var actionButtonArray : [EventActionButton]? = []
            currentEvent.actionButtons.forEach { event in
                actionButtonArray?.append(EventActionButton(buttonTitle: event.buttonTitle, buttonID: event.buttonID))
            }
            
            // MARK: - create category element
            let currentCategory: EventModelElement = EventModelElement(id: currentEvent.id,
                                                                       category: Array(currentEvent.category),
                                                                       images: Array(currentEvent.images),
                                                                       title: currentEvent.title,
                                                                       subTitle: currentEvent.subTitle,
                                                                       timeout: currentEvent.timeout,
                                                                       fond: currentEvent.fond,
                                                                       adress: currentEvent.adress,
                                                                       phones: currentEvent.phones,
                                                                       infoText: currentEvent.infoText,
                                                                       actionButtons: actionButtonArray )
            currentEventArray.append(currentCategory)
            print(currentCategory)
        }
        
        // MARK: - filter category array by id
        currentEventArray.forEach { (event) in
            let currentCategoryArray = event.category!.compactMap { $0 as String }
            if currentCategoryArray.contains(self.currentCategoryId) {
                self.categoryNewsArray.append(event)
            }
        }
        
        DispatchQueue.main.async {
            self.activityView.stopAnimating()
            self.newsTableView.reloadData()
        }
    }
    // MARK: - convert data from CoreData to model
    private func convertToModel(eventDataCategories: [Event]) {
        let actionButtonData = CoreDataManager.readActionButtonData()
        var currentEventArray: [EventModelElement] = []
        var i = 0
        var actionButtons : [EventActionButton]? = []
        
        for _ in eventDataCategories {
            
            for action in actionButtonData {
                actionButtons?.append(EventActionButton(buttonTitle: action.buttonTitle, buttonID: action.buttonID))
            }
            
            let el = EventModelElement(id: eventDataCategories[i].id,
                                       category: eventDataCategories[i].category,
                                       images: eventDataCategories[i].images,
                                       title: eventDataCategories[i].title,
                                       subTitle: eventDataCategories[i].subTitle,
                                       timeout: eventDataCategories[i].timeout,
                                       fond: eventDataCategories[i].fond,
                                       adress: eventDataCategories[i].adress,
                                       phones: eventDataCategories[i].phones,
                                       infoText: eventDataCategories[i].infoText,
                                       actionButtons: actionButtons)
            
            currentEventArray.append(el)
            i += 1
            actionButtons = []
        }
        
        // MARK: - filter category array by id
        currentEventArray.forEach { (event) in
            let currentCategoryArray = event.category!.compactMap { $0 as String }
            if currentCategoryArray.contains(self.currentCategoryId) {
                self.categoryNewsArray.append(event)
            }
        }
        
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
            self.activityView.stopAnimating()
        }
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
