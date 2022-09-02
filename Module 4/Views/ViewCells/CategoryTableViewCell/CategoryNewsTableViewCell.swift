//
//  CategoryNewsTableViewCell.swift
//  Module 4
//
//  Created by Влад Бокин on 28.08.2022.
//

import UIKit
import SnapKit

class CategoryNewsTableViewCell: UITableViewCell {

    static let identifier = "CategoryNewsTableViewCell"
    
    private lazy var newsTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.clipsToBounds = true
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.blueGrey
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 2
        titleLabel.font = R.font.officinaSansExtraBoldC(size: 21)
        return titleLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.clipsToBounds = true
        titleLabel.textColor = UIColor.darkSlateBlue
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 3
        titleLabel.font = R.font.sfuiTextRegular(size: 15)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var shadowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = R.image.imageShadow()
        return imageView
    }()
    
    private lazy var yellowHeartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = R.image.yellowHeart()
        return imageView
    }()
    
    private lazy var whiteBackView: UIView = {
        let backView = UIView()
        backView.backgroundColor = UIColor.whiteColor
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
        return backView
    }()
    
    private lazy var greenBarView: UIView = {
        let greenBar = UIView()
        greenBar.backgroundColor = UIColor.mainGreenColor
        greenBar.clipsToBounds = false
        greenBar.layer.cornerRadius = 5
        greenBar.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return greenBar
    }()
    
    private lazy var timeoutLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.clipsToBounds = true
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.whiteColor
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 1
        titleLabel.font = R.font.sfuiTextMedium(size: 11)
        return titleLabel
    }()
    
    private lazy var calendarIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = R.image.calendarIcon()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.lightGreyColor
        
        addSubview(whiteBackView)
        whiteBackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
            make.height.equalTo(405)
        }
        addSubview(newsImageView)
        newsImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(231)
        }
        
        addSubview(shadowImageView)
        shadowImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalTo(newsImageView).inset(-10)
            make.height.equalTo(231)
        }
        
        addSubview(newsTitleLabel)
        newsTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(54)
            make.top.equalToSuperview().inset(230)
            make.height.equalTo(46)
        }
        
        addSubview(yellowHeartImage)
        yellowHeartImage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(123)
            make.top.equalToSuperview().inset(278)
            make.height.equalTo(25)
        }
        
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(31)
            make.top.equalTo(yellowHeartImage).inset(30)
            make.height.equalTo(60)
        }
        
        addSubview(greenBarView)
        
        greenBarView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
            make.height.equalTo(31)
        }
        
       addSubview(timeoutLabel)
       timeoutLabel.snp.makeConstraints { make in
           make.centerX.equalToSuperview()
           make.bottom.equalTo(greenBarView).inset(8)
           make.height.equalTo(15)
        }
        
        addSubview(calendarIconImageView)
        calendarIconImageView.snp.makeConstraints { make in
            make.leading.equalTo(timeoutLabel).inset(-20)
            make.height.width.equalTo(14)
            make.centerY.equalTo(greenBarView)
         }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func setup(image: UIImage, title: String, subtitle: String, timeoutTitle: String) {
        newsTitleLabel.text = title
        let paragraphStyle = NSMutableParagraphStyle()
        // MARK: - line height size
        paragraphStyle.lineSpacing = 2
        let attrString = NSMutableAttributedString(string: subtitle)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
       
        subtitleLabel.attributedText = attrString
        subtitleLabel.textAlignment = NSTextAlignment.center
        newsImageView.image = image
        timeoutLabel.text = timeoutTitle
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
