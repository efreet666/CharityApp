//
//  CategoryCollectionViewCell.swift
//  Module 4
//
//  Created by Влад Бокин on 19.08.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //let categoryImageView = UIImageView()
    
     let categoryImageView: UIImageView = {
           let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            return imageView
        }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
            
        //categoryImageView.contentMode = .scaleAspectFill
        //categoryImageView.isUserInteractionEnabled = false
        contentView.addSubview(categoryImageView)
        
        categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        categoryImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        categoryImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        }
    
//    override func layoutSubviews() {
//            super.layoutSubviews()
//
//            var frame = categoryImageView.frame
//            frame.size.height = self.frame.size.height / 2 - 20
//            frame.size.width = self.frame.size.width / 2 - 20
//            frame.origin.x = self.frame.size.width / 2 - 30
//            frame.origin.y = self.frame.size.height / 2 - 30
//            categoryImageView.frame = frame
        
      
//        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
