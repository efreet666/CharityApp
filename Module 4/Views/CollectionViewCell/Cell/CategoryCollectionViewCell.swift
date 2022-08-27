//
//  CategoryCollectionViewCell.swift
//  Module 4
//
//  Created by Влад Бокин on 19.08.2022.
//

import UIKit
import Rswift
class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "CategoryCollectionViewCell"
    
    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var categoryNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.clipsToBounds = true
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor.lightOliveGreenColor
        nameLabel.font = R.font.officinaSansExtraBoldC(size: 15)
        return nameLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryNameLabel)

        // MARK: - make contstraint
        NSLayoutConstraint.activate([
            categoryImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            categoryImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -10),
            categoryImageView.widthAnchor.constraint(equalToConstant: 100),
            categoryImageView.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            categoryNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 130),
            categoryNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            categoryNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            categoryNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])

        }

    // MARK: - setup cell
    func setup(image: UIImage, text: String) {
        categoryNameLabel.text = text
        categoryImageView.image = image
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
