//
//  EventAdapter.swift
//  Module 4
//
//  Created by Влад Бокин on 10.10.2022.
//

import Foundation
import UIKit

class EventsAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var categoryNewsArray: [EventsEnum.ViewDidLoad.EventModelElement?] = []
    
    var delegate: EventTapDelegate?
    private enum Constants {
        static let cellHeight: CGFloat = 413
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryNewsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryNewsTableViewCell.identifier, for: indexPath) as? CategoryNewsTableViewCell else { return UITableViewCell() }
        
        cell.setup(image: UIImage(named: "\(categoryNewsArray[indexPath.row]?.images?.first ?? "")") ?? UIImage() , title: categoryNewsArray[indexPath.row]?.title ?? "error", subtitle: categoryNewsArray[indexPath.row]?.subTitle ?? "", timeoutTitle: categoryNewsArray[indexPath.row]?.timeout ?? "")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentEventDetail = categoryNewsArray[indexPath.row]
        //router?.navigateToDetailEvent(currentEventDetail: currentEventDetail)
        delegate?.eventCellTapped(currentEventDetail: EventsEnum.ViewDidLoad.ViewModel(EventArray: [currentEventDetail]))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.cellHeight
    }
    
}

