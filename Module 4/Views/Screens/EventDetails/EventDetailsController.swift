//
//  EventDetailsController.swift
//  Module 4
//
//  Created by Влад Бокин on 04.10.2022.
//

import UIKit

protocol EventDetailsDisplayLogic: AnyObject {
    func display(detailEventData: EventDetailEnum.ViewDidLoad.EventModelElement)
}

protocol helpButtonTapDelegate {
    func helpButtonAction(buttonTitle: String)
}

final class EventDetailsController: UIViewController {
    
    var interactor: EventDetailsBusinessLogic?
    var router: (EventDetailsRoutingLogic & EventDetailsDataPassing)?
    private lazy var adapter = EventDetailAdapter()
    
    //MARK: - current event detail data
    //var currentEventDetail: EventDetailEnum.ViewDidLoad.EventModelElement?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = EventDetailsInteractor()
        let presenter = EventDetailsPresenter()
        let router = EventDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.whiteColor
        return scrollView
    }()
    
    //MARK: - UI elements
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
        imageView.contentMode = .scaleAspectFill
        imageView.image = R.image.mail()
        return imageView
    }()
    
    private lazy var supportButton: UIButton = {
        let button = UIButton()
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
    
    private lazy var infoTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.charcoalGreyColor
        label.textAlignment = .left
        label.font = R.font.sfuiTextRegular(size: 15)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var openSiteLinkButton: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        return button
    }()
    
    private lazy var graySharingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGreyColor
        return view
    }()
    
    // MARK: - users icons
    private lazy var userIcon1ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    
    private lazy var userIcon1GrayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 19
        view.backgroundColor = UIColor.lightGreyColor
        return view
    }()
    
    private lazy var userIcon2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    
    private lazy var userIcon2GrayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 19
        view.backgroundColor = UIColor.lightGreyColor
        return view
    }()
    
    private lazy var userIcon3ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    
    private lazy var userIcon3GrayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 19
        view.backgroundColor = UIColor.lightGreyColor
        return view
    }()
    
    private lazy var userIcon4ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    
    private lazy var userIcon4GrayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 19
        view.backgroundColor = UIColor.lightGreyColor
        return view
    }()
    
    private lazy var userIcon5ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    
    private lazy var userIcon5GrayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 19
        view.backgroundColor = UIColor.lightGreyColor
        return view
    }()
    
    private lazy var totalUsersLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.greyColor
        label.textAlignment = .left
        label.font = R.font.ubuntuRegular(size: 13)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Help bar
    let bottomHelpBarView = HelpBarView()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.mainGreenColor
        self.tabBarController?.tabBar.isHidden = true
        setupUI()
        bottomHelpBarView.delegate = self
        interactor?.fetchEventDetails()
        
    }
    
    private func configireTextData(eventModelElement: EventDetailEnum.ViewDidLoad.EventModelElement) {
        // MARK: - title label
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        let attrString = NSMutableAttributedString(string: eventModelElement.title ?? "error")
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        titleLabel.attributedText = attrString
       
        // MARK: - labels
        timeoutLabel.text = eventModelElement.timeout
        fondNameLabel.text = eventModelElement.fond
        adressLabel.text = eventModelElement.adress
        phoneLabel.text = eventModelElement.phones
        supportLabel.text = "У вас есть вопросы?"
        
        // MARK: - supportButton
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: R.font.sfuiTextRegular(size: 15) ?? UIFont(),
            .foregroundColor: UIColor.mainGreenColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
            string: "Напишите нам",
            attributes: yourAttributes)
        supportButton.setAttributedTitle(attributeString, for: .normal)
        
        // MARK: - images
        bigLeftImageView.image = UIImage(named: "\(eventModelElement.images?[0] ?? "")") ?? UIImage()
        topRightImageView.image = UIImage(named: "\(eventModelElement.images?[1] ?? "")") ?? UIImage()
        bottomRightImageView.image = UIImage(named: "\(eventModelElement.images?[2] ?? "")") ?? UIImage()
        
        // MARK: - info event text
        infoTextLabel.text = eventModelElement.infoText
        
        // MARK: - open site button
        let siteTextAttributes: [NSAttributedString.Key: Any] = [
            .font: R.font.sfuiTextRegular(size: 15) ?? UIFont(),
            .foregroundColor: UIColor.mainGreenColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let siteAttributeString = NSMutableAttributedString(
            string: "Перейти на сайт организаии",
            attributes: siteTextAttributes)
        openSiteLinkButton.setAttributedTitle(siteAttributeString, for: .normal)
        
        //MARK: - users icons
        userIcon1ImageView.image = R.image.userIcon1()
        userIcon2ImageView.image = R.image.userIcon2()
        userIcon3ImageView.image = R.image.userIcon3()
        userIcon4ImageView.image = R.image.userIcon4()
        userIcon5ImageView.image = R.image.userIcon5()
        totalUsersLabel.text = "+102"
    }
    // MARK: - set constraints
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
            make.top.equalTo(fondNameLabel).inset(38)
            make.height.equalTo(40)
            make.width.equalTo(296)
            make.leading.equalTo(43)
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
            make.leading.equalTo(43)
        }
        
        scrollView.addSubview(phoneIconImageView)
        phoneIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.height.width.equalTo(14)
            make.top.equalTo(adressLabel).inset(59)
        }
        
        scrollView.addSubview(supportLabel)
        supportLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel).inset(56)
            make.height.equalTo(20)
            make.width.equalTo(152)
            make.leading.equalTo(47)
        }
        
        scrollView.addSubview(supportIconImageView)
        supportIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(11)
            make.width.equalTo(18)
            make.top.equalTo(phoneLabel).inset(61)
        }
        
        scrollView.addSubview(supportButton)
        supportButton.snp.makeConstraints { make in
            make.leading.equalTo(supportLabel).inset(144)
            make.height.equalTo(20)
            make.width.equalTo(129)
            make.top.equalTo(phoneLabel).inset(55)
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
        
        scrollView.addSubview(infoTextLabel)
        infoTextLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(150)
            make.width.equalTo(335)
            make.top.equalTo(bottomRightImageView).inset(89)
        }
        
        scrollView.addSubview(openSiteLinkButton)
        openSiteLinkButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(20)
            make.width.equalTo(220)
            make.top.equalTo(infoTextLabel).inset(156)
        }
        
        //MARK: - user's icons
        scrollView.addSubview(graySharingView)
        graySharingView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(68)
            make.width.equalToSuperview()
            make.top.equalTo(openSiteLinkButton).inset(52)
        }
        
        scrollView.addSubview(userIcon5GrayView)
        userIcon5GrayView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(154)
            make.height.width.equalTo(40)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(userIcon5ImageView)
        userIcon5ImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(156)
            make.height.width.equalTo(36)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(userIcon4GrayView)
        userIcon4GrayView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(120)
            make.height.width.equalTo(40)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(userIcon4ImageView)
        userIcon4ImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(122)
            make.height.width.equalTo(36)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(userIcon3GrayView)
        userIcon3GrayView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(86)
            make.height.width.equalTo(40)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(userIcon3ImageView)
        userIcon3ImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(88)
            make.height.width.equalTo(36)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(userIcon2GrayView)
        userIcon2GrayView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(52)
            make.height.width.equalTo(40)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(userIcon2ImageView)
        userIcon2ImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(54)
            make.height.width.equalTo(36)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(userIcon1GrayView)
        userIcon1GrayView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(18)
            make.height.width.equalTo(40)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(userIcon1ImageView)
        userIcon1ImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.height.width.equalTo(36)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(totalUsersLabel)
        totalUsersLabel.snp.makeConstraints { make in
            make.leading.equalTo(userIcon5GrayView).inset(46)
            make.height.equalTo(20)
            make.width.equalTo(36)
            make.centerY.equalTo(graySharingView).inset(18)
        }
        
        scrollView.addSubview(bottomHelpBarView)
        bottomHelpBarView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(70)
            make.width.equalToSuperview()
            make.top.equalTo(graySharingView).inset(68)
            make.bottom.equalToSuperview()
        }
    }
    
    private func configureNavBar(eventModelElement: EventDetailEnum.ViewDidLoad.EventModelElement) {
        self.title = eventModelElement.title
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(sharingLink))
        shareButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = shareButton
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.whiteColor]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    // MARK: - Activity controller
    var activitiViewContorller: UIActivityViewController? = nil
    @objc func sharingLink() {
        self.activitiViewContorller = UIActivityViewController(activityItems: [R.string.localizable.helpTitle()], applicationActivities: nil)
        self.present(self.activitiViewContorller!, animated: true, completion: nil)
    }
}

extension EventDetailsController: EventDetailsDisplayLogic {
    func display(detailEventData: EventDetailEnum.ViewDidLoad.EventModelElement) {
        configureNavBar(eventModelElement: detailEventData)
        configireTextData(eventModelElement: detailEventData)
        bottomHelpBarView.configure(eventModelElement: detailEventData)
    }
}

extension EventDetailsController: helpButtonTapDelegate {
    //MARK: - helpBar action
    func helpButtonAction(buttonTitle: String) {
        print(buttonTitle)
    }
}
