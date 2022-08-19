//
//  CategoryCollectionViewCell.swift
//  Module 4
//
//  Created by Влад Бокин on 19.08.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    let categoryImageView = UIImageView()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            
        categoryImageView.contentMode = .scaleAspectFill
        categoryImageView.isUserInteractionEnabled = false
        contentView.addSubview(categoryImageView)
        }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            
            var frame = categoryImageView.frame
            frame.size.height = self.frame.size.height / 2
            frame.size.width = self.frame.size.width / 2
            frame.origin.x = self.frame.size.width / 2 - 20
            frame.origin.y = self.frame.size.height / 2 - 20
            categoryImageView.frame = frame
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
