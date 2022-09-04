//
//  HelpBarView.swift
//  Module 4
//
//  Created by Влад Бокин on 02.09.2022.
//

import UIKit

class HelpBarView: UIView {
    
    var delegate: helpButtonTapDelegate?
    
    lazy var actionButtoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor.whiteColor
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(eventModelElement: EventModelElement) {
        guard let eventData = eventModelElement.actionButtons else { return}
        var counter = 0
        eventData.forEach({ event in
            counter += 1
            var container2 = AttributeContainer()
            container2.foregroundColor = UIColor.white
            container2.font = R.font.sfuiTextMedium(size: 10)
            var configuration = UIButton.Configuration.filled()
            // MARK: - set button icon
            switch event.buttonID {
            case "1": configuration.image = R.image.shirt()
            case "2": configuration.image = R.image.hands()
            case "3": configuration.image = R.image.tools()
            case "4": configuration.image = R.image.coins()
            case .none:
                print("none")
            case .some(_):
                print("some")
            }
            // MARK: - set title
            configuration.subtitle = event.buttonTitle
            configuration.imagePlacement = .top
            configuration.baseForegroundColor = UIColor.warmGreyColor
            configuration.baseBackgroundColor = UIColor.white
            configuration.imagePadding = 5
            configuration.buttonSize = .mini
            configuration.titlePadding = 30
            configuration.titleAlignment = .center
            // MARK: - set button icon
            let helpButton = UIButton(configuration: configuration, primaryAction: nil)
            helpButton.subtitleLabel?.font = R.font.sfuiTextMedium(size: 10)
            helpButton.subtitleLabel?.textAlignment = .center
            helpButton.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            // MARK: - add on stackView
            addSubview(actionButtoStackView)
            actionButtoStackView.snp.makeConstraints { make in
                make.bottom.top.leading.trailing.equalToSuperview()
            }
            // MARK: - check max buttons count on help bar
            if counter <= 4 {
                actionButtoStackView.addArrangedSubview(helpButton)
                // MARK: - check last element
                if eventData.count != counter {
                    let separateImageView = UIImageView()
                    separateImageView.image = R.image.separator()
                    actionButtoStackView.addArrangedSubview(separateImageView)
                    separateImageView.snp.makeConstraints { make in
                        make.width.equalTo(1)
                        make.height.equalToSuperview()
                        make.top.bottom.equalToSuperview()
                    }
                }
            }
        })
    }
    
    @objc func buttonTapped(button: UIButton) {
        delegate?.helpButtonAction(buttonTitle: button.subtitleLabel?.text ?? "")
    }
}
