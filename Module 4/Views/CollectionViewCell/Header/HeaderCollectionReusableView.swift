//
//  HeaderCollectionReusableView.swift
//  Module 4
//
//  Created by Влад Бокин on 20.08.2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = " "

    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.clipsToBounds = true
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont(name: "SFUIText-Regular", size: 17)
        headerLabel.text = "Выберите категорию помощи"
        headerLabel.textColor = UIColor(red: 73.0 / 255.0, green: 74.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
        return headerLabel
    }()

    // MARK: - configure header
    public func configure() {
        backgroundColor = .white
        addSubview(headerLabel)
    }
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17)
        ])
    }
}
