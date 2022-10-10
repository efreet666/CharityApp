//
//  CategoriesView.swift
//  Module 4
//
//  Created by Влад Бокин on 03.10.2022.
//

import UIKit
import Rswift

protocol CategoriesDisplayLogic: AnyObject {
    func display(categoriesData: CategoriesEnum.ViewDidLoad.ViewModel)
}

protocol CellTapDelegate {
    func cellTap(currentCategoryTitle: String, currentCategoryId: String)
}

class CategoriesController: UIViewController {
    
    // MARK: - External vars
    private(set) var router: CategoriesRoutingLogic?
    
    private lazy var adapter = CategoriesAdapter()
    
    // MARK: - Internal vars
    private var interactor: CategoriesBisnesslogic?
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    // MARK: - Setup
    private func setup() {
        let viewController = self
        let presenter = CategoriesPresenter()
        let interactor = CategoriesInteractor()
        let router = CategoriesRouter()
        
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
    
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
        
        interactor?.requestCategories()
        adapter.delegate = self
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func checkLoadedData(categoriesData: CategoriesEnum.ViewDidLoad.ViewModel) {
        if categoriesData.categotiesArray.isEmpty {
            errorAlert(title: R.string.localizable.errorTitle() , message: R.string.localizable.erroSubtitle(), style: .alert)
        }
    }
    // MARK: - setup collectionView
    private func setupCollectionView() {
        // MARK: - collection view layout
        let layout = UICollectionViewFlowLayout() // UICollectionViewCompositionalLayout
        /// Use UICollectionViewDiffableDataSource
        layout.sectionInset = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
        layout.itemSize = CGSize(width: (self.view.frame.width - 28) / 2, height: 160)
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 84, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: layout)
        
        collectionView.dataSource = adapter
        collectionView.delegate = adapter
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
        navigationController?.navigationBar.barTintColor = UIColor.green
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.whiteColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    private func errorAlert(title: String, message: String, style: UIAlertController.Style){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.interactor?.requestCategories()
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - back button
    @objc private func popVC() {
        print("Button tapped")
        // MARK: - close application
        exit(-1)
    }
    
}

// MARK: - Display logic
extension CategoriesController: CategoriesDisplayLogic {
    func display(categoriesData: CategoriesEnum.ViewDidLoad.ViewModel) {
        self.activityView.stopAnimating()
        adapter.categoriesData = categoriesData
    
        self.collectionView.reloadData()
        self.checkLoadedData(categoriesData: categoriesData)
    }
}

extension CategoriesController: CellTapDelegate {
    func cellTap(currentCategoryTitle: String, currentCategoryId: String) {
        router?.navigateToEvents(currentCategoryTitle: currentCategoryTitle, currentCategoryId: currentCategoryId)
    }
    
    
}
