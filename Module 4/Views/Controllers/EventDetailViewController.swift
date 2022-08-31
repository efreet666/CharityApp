//
//  EventDetailViewController.swift
//  Module 4
//
//  Created by Влад Бокин on 30.08.2022.
//

import UIKit
import SnapKit

class EventDetailViewController: UIViewController {
    
    var currentEventDetail: EventModelElement?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.whiteColor
        return scrollView
    }()
    
    //Mark: - UI elements
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blueGrey
        label.textAlignment = .left
        label.font = R.font.officinaSansExtraBoldC(size: 21)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var timeoutLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor.greyColor
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        label.font = R.font.sfuiTextMedium(size: 11)
        return label
    }()
    
    private lazy var calendarIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = R.image.calendarGrayIcon()
        return imageView
    }()
    
    private lazy var fondNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.charcoalGreyColor
        label.textAlignment = .left
        label.font = R.font.sfuiTextRegular(size: 11)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var adressLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.charcoalGreyColor
        label.textAlignment = .left
        label.font = R.font.sfuiTextRegular(size: 15)
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    private lazy var navIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = R.image.iconNav()
        return imageView
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.charcoalGreyColor
        label.textAlignment = .left
        label.font = R.font.sfuiTextRegular(size: 15)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var phoneIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = R.image.iconPhone()
        return imageView
    }()
    
    private lazy var supportLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.charcoalGreyColor
        label.textAlignment = .left
        label.font = R.font.sfuiTextRegular(size: 15)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var supportIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = R.image.mail()
        return imageView
    }()
    
    private lazy var supportButton: UIButton = {
        let button = UIButton()
        
        button.setTitleColor(UIColor.mainGreenColor, for: .normal)
        //button. = R.font.sfuiTextRegular(size: 15)
        return button
    }()
    
    private lazy var bigLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var topRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var bottomRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    

    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.mainGreenColor
        self.tabBarController?.tabBar.isHidden = true
        
        configureNavBar()
        setupUI()
        configireTextData()
    }
    
    private func configireTextData() {
        //title
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        let attrString = NSMutableAttributedString(string: currentEventDetail?.title ?? "error")
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        titleLabel.attributedText = attrString
        
        //timeoutLabel
        timeoutLabel.text = currentEventDetail?.timeout ?? "error"
        
        fondNameLabel.text = currentEventDetail?.fond ?? "error"
        
        adressLabel.text = currentEventDetail?.adress ?? "error"
        
        phoneLabel.text = currentEventDetail?.phones ?? "error"
        
        supportLabel.text = "У вас есть вопросы?"
        
        supportButton.setTitle("Напишите нам", for: .normal)
        
        bigLeftImageView.image = R.image.newsImages1()
        topRightImageView.image = R.image.newsImages1()
        bottomRightImageView.image = R.image.newsImages1()
    }
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview()
            make.top.equalTo(80)
        }
        
        scrollView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
            make.height.equalTo(46)
            make.width.equalTo(267)
        }
        
        scrollView.addSubview(timeoutLabel)
        timeoutLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(44)
            make.height.equalTo(13)
            make.height.equalTo(230)
            make.top.equalTo(titleLabel).inset(63)
         }
         
        scrollView.addSubview(calendarIconImageView)
         calendarIconImageView.snp.makeConstraints { make in
             make.leading.equalToSuperview().inset(20)
             make.height.width.equalTo(14)
             make.top.equalTo(titleLabel).inset(63)
          }
        
        scrollView.addSubview(fondNameLabel)
        fondNameLabel.snp.makeConstraints { make in
            make.top.equalTo(timeoutLabel).inset(23)
            make.height.equalTo(20)
            make.width.equalTo(313)
            make.leading.equalTo(20)
        }
        
        scrollView.addSubview(adressLabel)
        adressLabel.snp.makeConstraints { make in
            make.top.equalTo(fondNameLabel).inset(35)
            make.height.equalTo(40)
            make.width.equalTo(296)
            make.leading.equalTo(46)
        }
        
        scrollView.addSubview(navIconImageView)
        navIconImageView.snp.makeConstraints { make in
             make.leading.equalToSuperview().inset(20)
             make.height.width.equalTo(14)
             make.top.equalTo(fondNameLabel).inset(42)
          }
        
        scrollView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(adressLabel).inset(56)
            make.height.equalTo(40)
            make.width.equalTo(296)
            make.leading.equalTo(46)
        }
        
        scrollView.addSubview(phoneIconImageView)
        phoneIconImageView.snp.makeConstraints { make in
             make.leading.equalToSuperview().inset(20)
             make.height.width.equalTo(14)
             make.top.equalTo(adressLabel).inset(61)
          }
        
        scrollView.addSubview(supportLabel)
        supportLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel).inset(56)
            make.height.equalTo(20)
            make.width.equalTo(152)
            make.leading.equalTo(46)
        }
        
        scrollView.addSubview(supportIconImageView)
        supportIconImageView.snp.makeConstraints { make in
             make.leading.equalToSuperview().inset(20)
             make.height.width.equalTo(14)
             make.top.equalTo(phoneLabel).inset(58)
          }
        
        scrollView.addSubview(supportButton)
        supportButton.snp.makeConstraints { make in
             make.leading.equalTo(supportLabel).inset(153)
             make.height.equalTo(20)
             make.width.equalTo(129)
             make.top.equalTo(phoneLabel).inset(58)
          }
        
        scrollView.addSubview(bigLeftImageView)
        bigLeftImageView.snp.makeConstraints { make in
             make.leading.equalToSuperview().inset(20)
             make.height.equalTo(168)
             make.width.equalTo(222)
             make.top.equalTo(supportLabel).inset(36)
          }
        
        scrollView.addSubview(topRightImageView)
        topRightImageView.snp.makeConstraints { make in
            make.leading.equalTo(bigLeftImageView).inset(232)
            make.height.equalTo(79)
            make.width.equalTo(103)
            make.top.equalTo(supportLabel).inset(36)
          }
        
        scrollView.addSubview(bottomRightImageView)
        bottomRightImageView.snp.makeConstraints { make in
            make.leading.equalTo(bigLeftImageView).inset(232)
            make.height.equalTo(79)
            make.width.equalTo(103)
            make.top.equalTo(topRightImageView).inset(89)
          }
    }
    private func configureNavBar() {
        self.title = currentEventDetail?.title ?? "error"
        
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(sharingLink))
        shareButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = shareButton
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.whiteColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    @objc func sharingLink() {
        print("share smth")
    }
}
