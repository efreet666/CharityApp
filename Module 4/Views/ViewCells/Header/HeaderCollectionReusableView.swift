//
//  HeaderCollectionReusableView.swift
//  Module 4
//
//  Created by Влад Бокин on 20.08.2022.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "HeaderCollectionReusableView"

    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.clipsToBounds = true
        headerLabel.textAlignment = .center
        headerLabel.font = R.font.sfuiTextRegular(size: 17)
        headerLabel.text = R.string.localizable.chooseCategory()
        headerLabel.textColor = UIColor.charcoalGreyColor
        return headerLabel
    }()

    // MARK: - configure header
    public func configure() {
        backgroundColor = UIColor.whiteColor
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
