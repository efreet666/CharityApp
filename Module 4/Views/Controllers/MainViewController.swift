//
//  MainViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 16.08.2022.
//

import Foundation
import UIKit
import Rswift

final class MainViewController: UIViewController {
    
    private var categoriesData: CategoriesModel? = []
    private var categories = [Categories]()
    
    private enum Constants {
        static let headerHeight: CGFloat = 57
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .gray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var activityView = UIActivityIndicatorView()
    
    private func showActivityIndicator() {
        // MARK: - Show activity view
        self.activityView = Spinner.activityIndicator(style: .large,
                                                      center: self.view.center)
        self.view.addSubview(self.activityView)
        self.activityView.startAnimating()
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mainGreenColor
        setupCollectionView()
        setupNavBar()
        showActivityIndicator()
        
//        setupPersistance()
        
        //categoriesData = CategoriesService.getCategories()
        setupUI()
    }
    func setupUI() {
        DispatchQueue.global(qos: .userInitiated).sync {
        
        self.categoriesData = CategoriesService.getCategories()
        
            print(self.categoriesData)
            DispatchQueue.main.async {
                        self.activityView.stopAnimating()
                        self.collectionView.reloadData()
                        print("update end")
                    }
        }
       
    }
    
//    private func setupPersistance() {
//        // MARK: - Check flag for using DB
//        switch UsingDataBaseFlag.flag {
//
//        case .coreData:
//            DispatchQueue.global(qos: .userInitiated).async {
//                // MARK: - save data from network request
//                CoreDataClient.saveCategoryData(categoriesData: self.categoryDataRequest())
//
//                // MARK: - Read data from CoreData
//                self.categories = CoreDataClient.readCategoryData()
//
//                // MARK: - Convert to our model
//                ///self.convertCoreDataToModel(CoreDataCategories: self.categories)
//            }
//
//        case .Realm:
//            DispatchQueue.global(qos: .userInitiated).sync {
//                // MARK: - save data from network to Realm
//                RealmClient.saveCategoryData(categoriesData: self.categoryDataRequest())
//
//                // MARK: - Convert to our model
//                self.convertRealmDataToModel()
//            }
//        }
//    }
    
//    private func categoryDataRequest() -> CategoriesModel {
//        var requestData = self.networkRequestData()
//        if requestData.isEmpty {
//            requestData = LocalJSONData.parseCategoryDataFromJSON()
//        }
//        return requestData
//    }
    
//    private func networkRequestData() -> CategoriesModel { // completion block
//
//        var categoryData: CategoriesModel?
//        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
//
//        // MARK: - Check flag
//        switch UsingNetworkServiceFlag.flag {
//
//        case .URLSession:
//            let categoryRequest = Request(title: "")
//            URLSessionManager().send(categoryRequest, URL: NetworkingURL.categoryURL) { (result: Result<CategoriesModel, APIError>) -> Void in
//                switch result {
//                case .success(let data):
//                    print(data)
//                    categoryData = data
//                case .failure(let error):
//                    print(error)
//                }
//                semaphore.signal()
//            }
//            semaphore.wait()
//
//        case .Alamofire:
//            AlamofireManager.requestCategoryData(NetworkingURL.categoryURL) { result in
//                switch result {
//                case .success(let categoriesData):
//                    print(categoriesData)
//                    categoryData = categoriesData
//                case .failure(let err):
//                    print(err)
//                }
//            }
//        }
//        return categoryData ?? CategoriesModel()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
//    // MARK: - write Realm data and convert our model
//    private func convertRealmDataToModel() {
//        let data = RealmClient.readCategoryData()
//        data.forEach { category in
//            let currentCategory: CategoriesModelElement = CategoriesModelElement(id: category.id, title: category.title, image: category.image)
//            categoriesData?.append(currentCategory)
//        }
//
//        DispatchQueue.main.async {
//            self.activityView.stopAnimating()
//            self.collectionView.reloadData()
//        }
//    }
    
//    // MARK: - write CoreData data and convert our model
//    private func convertCoreDataToModel(CoreDataCategories: [Categories]) {
//        var i = 0
//        for _ in CoreDataCategories {
//            let el = CategoriesModelElement(id: CoreDataCategories[i].id,
//                                            title: CoreDataCategories[i].title,
//                                            image: CoreDataCategories[i].image)
//            categoriesData?.append(el)
//            i += 1
//        }
//        DispatchQueue.main.async {
//            self.activityView.stopAnimating()
//            self.collectionView.reloadData()
//        }
//    }
    
    // MARK: - setup collectionView
    private func setupCollectionView() {
        // MARK: - collection view layout
        let layout = UICollectionViewFlowLayout() // UICollectionViewCompositionalLayout
        // UICollecrtionViewDiffableDataSource
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
        self.title = R.string.localizable.helpTitle()
        let closeItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(popVC))
        closeItem.tintColor = .white
        self.navigationItem.leftBarButtonItem = closeItem
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.whiteColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    func errorAlert(title: String, message: String, style: UIAlertController.Style){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - back button
    @objc func popVC() {
        print("Button tapped")
        // MARK: - close application
        exit(-1)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = categoriesData?.count {
            return count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = UIColor.lightGreyColor
        cell.setup(image: UIImage(named: "\(categoriesData?[indexPath.row].image ?? "")") ?? UIImage()
                   ,text: categoriesData?[indexPath.row].title ?? "")
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CurrentCategoryViewController()
        vc.currentCategoryTitle = categoriesData?[indexPath.row].title ?? ""
        vc.currentCategoryId = categoriesData?[indexPath.row].id ?? ""
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

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: Constants.headerHeight)
    }
}
