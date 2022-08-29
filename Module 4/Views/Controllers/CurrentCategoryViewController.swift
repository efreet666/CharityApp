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
        
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.mainGreenColor
        self.navigationController?.title = currentCategoryName
        self.title = currentCategoryName
        self.tabBarController?.tabBar.backgroundColor = .whiteColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func setupTableView() {
        
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

}

extension CurrentCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryNewsTableViewCell.identifier, for: indexPath) as? CategoryNewsTableViewCell else { return UITableViewCell() }
        
        cell.setup(image: R.image.newsImages() ?? UIImage() , title: "Спонсоры отремонтируют школу-интернат", subtitle: "Дубовская школа-интернат для детей с ограниченными возможностями здоровья стала первой в области …")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
}
