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
    var pageTitle = ""
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blueGrey
        label.textAlignment = .left
        label.font = R.font.officinaSansExtraBoldC(size: 21)
        
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.whiteColor
        return scrollView
    }()
    
    private lazy var timeoutLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.greyColor
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 1
        titleLabel.font = R.font.sfuiTextMedium(size: 11)
        titleLabel.text = "Осталось 13 дней (21.09 – 20.10)"
        return titleLabel
    }()
    
    private lazy var calendarIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = R.image.calendarGrayIcon()
        return imageView
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.mainGreenColor
        self.tabBarController?.tabBar.isHidden = true
        
        configureNavBar()
        setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        configireTextData()
        print(currentEventDetail)
    }
    
    private func configireTextData() {
        let paragraphStyle = NSMutableParagraphStyle()
        //line height size
        paragraphStyle.lineSpacing = 6
        let attrString = NSMutableAttributedString(string: currentEventDetail?.title ?? "error")
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
       
        titleLabel.attributedText = attrString
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
    }
    private func configureNavBar() {
        self.title = pageTitle
        
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
