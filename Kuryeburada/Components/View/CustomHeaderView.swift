//
//  Deneme.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 14.01.2023.
//

import UIKit
import SnapKit

class CustomHeaderView: UIView {
    
    lazy var middleHeadLabel = UILabel()
    lazy var leftHeadLabel = UILabel()
    lazy var sayHiLabel = UILabel()
    lazy var leftOneLabel = UILabel()
    lazy var destinationViewController = UIViewController()
    lazy var currentViewController = UIViewController()
    lazy var headImageButton = UIButton()
    lazy var righIconButton = UIButton()
    lazy var firstRightIcon = UIButton()
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(leftButtonImage: String, middleHeaderText: String, currentVC: UIViewController, destinationVC : UIViewController){
        super.init(frame: .zero)
        configureUI()
        self.headImageButton.setImage(UIImage(named: leftButtonImage), for: .normal)
        self.middleHeadLabel.text = middleHeaderText
        self.destinationViewController = destinationVC
        self.currentViewController = currentVC
    }
    
    init(leftButtonImage: String, leftHeadText: String, sayHiText: String, rightButtonIcon: String, currentVC: UIViewController, destinationVC : UIViewController){
        super.init(frame: .zero)
        configureUI()
        self.headImageButton.setImage(UIImage(named: leftButtonImage), for: .normal)
        self.leftHeadLabel.text = leftHeadText
        self.sayHiLabel.text = sayHiText
        self.righIconButton.setImage(UIImage(named: rightButtonIcon), for: .normal)
        self.destinationViewController = destinationVC
        self.currentViewController = currentVC
    }
    
    init(leftButtonImage: String, leftOneText: String, rightButtonIcon: String, currentVC: UIViewController, destinationVC: UIViewController){
        super.init(frame: .zero)
        configureUI()
        self.headImageButton.setImage(UIImage(named: leftButtonImage), for: .normal)
        self.leftOneLabel.text = leftOneText
        self.righIconButton.setImage(UIImage(named: rightButtonIcon), for: .normal)
        self.destinationViewController = destinationVC
        self.currentViewController = currentVC
    }
    
    init(leftButtonImage: String, leftOneText: String, firstRightIcon: String, rightButtonIcon: String, currentVC: UIViewController, destinationVC: UIViewController){
        super.init(frame: .zero)
        configureUI()
        self.headImageButton.setImage(UIImage(named: leftButtonImage), for: .normal)
        self.leftOneLabel.text = leftOneText
        self.righIconButton.setImage(UIImage(named: rightButtonIcon), for: .normal)
        self.destinationViewController = destinationVC
        self.currentViewController = currentVC
        self.firstRightIcon.setImage(UIImage(named: "\(firstRightIcon)"), for: .normal)
    }
    
    private func configureUI(){
        
        snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        backgroundColor = .white
    
        
        addSubview(headImageButton)
        headImageButton.tintColor = .primaryGray
        headImageButton.layer.cornerRadius = 20
        headImageButton.layer.masksToBounds = false
        headImageButton.clipsToBounds = true
        headImageButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }
        headImageButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        addSubview(middleHeadLabel)
        middleHeadLabel.font = Font.header1()
        middleHeadLabel.textColor = .primaryDarkBlue
        middleHeadLabel.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(headImageButton)
        }
        
        addSubview(leftHeadLabel)
        leftHeadLabel.font = Font.header3()
        leftHeadLabel.textColor = .primaryDarkBlue
        leftHeadLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(headImageButton.snp.trailing).offset(16)
        }
        
        addSubview(leftOneLabel)
        leftOneLabel.font = Font.header1()
        leftOneLabel.textColor = .primaryDarkBlue
        leftOneLabel.snp.makeConstraints { make in
            make.centerY.equalTo(headImageButton)
            make.leading.equalTo(headImageButton.snp.trailing).offset(16)
        }
        
        addSubview(sayHiLabel)
        sayHiLabel.font = Font.labelFont()
        sayHiLabel.textColor = .primaryGray
        sayHiLabel.snp.makeConstraints { make in
            make.bottom.equalTo(leftHeadLabel.snp.top).offset(-4)
            make.leading.equalTo(headImageButton.snp.trailing).offset(16)
        }
        
        addSubview(righIconButton)
        righIconButton.setTitleColor(.secondaryGreen, for: .normal)
        righIconButton.snp.makeConstraints { make in
            make.centerY.equalTo(headImageButton)
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(40)
        }
        
        addSubview(firstRightIcon)
        firstRightIcon.setTitleColor(.secondaryGreen, for: .normal)
        firstRightIcon.snp.makeConstraints { make in
            make.centerY.equalTo(headImageButton)
            make.trailing.equalTo(righIconButton.snp.leading).offset(-16)
            make.height.width.equalTo(40)
        }
     
                
    }
    @objc func backButtonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .left)

    }
    
}
