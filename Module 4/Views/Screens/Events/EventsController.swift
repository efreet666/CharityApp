//
//  EventsController.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import UIKit

protocol EventsDisplayLogic: AnyObject {
    func display(viewModel: EventsEnum.ViewDidLoad.ViewModel)
}

protocol EventTapDelegate {
    func eventCellTapped(currentEventDetail: EventsEnum.ViewDidLoad.ViewModel)
}

final class EventsController: UIViewController {

  var interactor: EventsBusinessLogic?
  var router: (EventsRoutingLogic & EventsDetailDataPassing)?

    // MARK: - Vars
    var currentCategoryTitle: String?
    private lazy var adapter = EventsAdapter()
    
    
  // MARK: Object lifecycle

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: Setup

  private func setup() {
    let viewController = self
    let interactor = EventsInteractor()
    let presenter = EventsPresenter()
    let router = EventsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
    
    private lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var activityView = UIActivityIndicatorView()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainGreenColor
        setupTableView()
        configureNavBar()
        showActivityIndicator()
        interactor?.fetchEvents()
        adapter.delegate = self
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
        newsTableView.dataSource = adapter
        newsTableView.delegate = adapter
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
        
        self.tabBarController?.tabBar.backgroundColor = .whiteColor
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor
    }
}

// MARK: - DisplayLogic
extension EventsController: EventsDisplayLogic {
    func display(viewModel: EventsEnum.ViewDidLoad.ViewModel) {
        self.activityView.stopAnimating()
        adapter.categoryNewsArray = viewModel.EventArray
        self.newsTableView.reloadData()
        self.title = viewModel.currentCategoryTitle
    }

}

extension EventsController: EventTapDelegate {
    func eventCellTapped(currentEventDetail: EventsEnum.ViewDidLoad.ViewModel) {
        router?.navigateToDetailEvent(currentEventDetail: currentEventDetail.EventArray.first!!)
    }
    
  
}

