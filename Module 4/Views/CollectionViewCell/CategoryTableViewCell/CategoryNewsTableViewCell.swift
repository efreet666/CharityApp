//
//  CategoryNewsTableViewCell.swift
//  Module 4
//
//  Created by Влад Бокин on 28.08.2022.
//

import UIKit

class CategoryNewsTableViewCell: UITableViewCell {

    static let identifier = "CategoryNewsTableViewCell"
    
    private lazy var newsTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.clipsToBounds = true
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.lightOliveGreenColor
        titleLabel.font = R.font.officinaSansExtraBoldC(size: 15)
        return titleLabel
    }()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.addSubview(newsTitleLabel)
        
        NSLayoutConstraint.activate([
            newsTitleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            newsTitleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -10),
            newsTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            newsTitleLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    func setup(image: UIImage, text: String) {
        newsTitleLabel.text = text
        newsImageView.image = image
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
