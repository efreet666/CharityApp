//
//  CurrnetCategoryViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 28.08.2022.
//

import UIKit

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

        setupTableView()
        
        view.backgroundColor = UIColor.mainGreenColor
        self.navigationController?.navigationBar.backgroundColor = UIColor.mainGreenColor
        self.navigationController?.title = currentCategoryName
        
    }
    
    private func setupTableView() {
        view.addSubview(newsTableView)
        
        newsTableView.frame = CGRect(x: 0, y: 56, width: self.view.frame.width, height: self.view.frame.height)
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.register(CategoryNewsTableViewCell.self, forCellReuseIdentifier: CategoryNewsTableViewCell.identifier)
        
        
    }

}

extension CurrentCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryNewsTableViewCell.identifier, for: indexPath) as? CategoryNewsTableViewCell else { return UITableViewCell() }
        
        //cell.setup(image: R.image.newsImages()! , text: "aaa")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
}
