//
//  CustomTransitButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 16.01.2023.
//

import UIKit

class CustomTransitView: UIView{
    
    lazy var destinationViewController = UIViewController()
    lazy var currentViewController = UIViewController()
    lazy var transitImg = UIImageView()
    lazy var transitLbl = UILabel()
    lazy var transitInfoLbl = UILabel()
    lazy var caseLabel = UILabel()
    lazy var bigButton = UIButton()


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(transitLabel: String, infoText: String, transitImage: String, caseText: String ){
        super.init(frame: .zero)
        configureUI()
        transitLbl.text = transitLabel
        transitInfoLbl.text = infoText
        transitImg.image = UIImage(named: "\(transitImage)")
        caseLabel.text = caseText
  
    }
    
    init(transitLabel: String, infoText: String, transitImage: String, caseText: String, bigButtonText: String, currentVC: UIViewController, destinationVC: UIViewController ){
        super.init(frame: .zero)
        configureUI()
        transitLbl.text = transitLabel
        transitInfoLbl.text = infoText
        transitImg.image = UIImage(named: "\(transitImage)")
        caseLabel.text = caseText
        bigButton.setTitle(bigButtonText, for: .normal)
        destinationViewController = destinationVC
        currentViewController = currentVC
    }
    
    
    private func configureUI(){
        
        snp.makeConstraints { make in
            make.height.equalTo(144)
        }
        
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 20
        layer.borderColor = UIColor.primaryGray?.cgColor
        
        addSubview(transitImg)
        transitImg.backgroundColor = .primaryLightBack
        transitImg.layer.masksToBounds = false
        transitImg.layer.borderColor = UIColor.primaryLightBack?.cgColor
        transitImg.layer.cornerRadius = 30
        transitImg.clipsToBounds = true
        transitImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(60)
        }
        
        addSubview(transitLbl)
        transitLbl.textColor = .primaryDarkBlue
        transitLbl.font = Font.header3()
        transitLbl.snp.makeConstraints { make in
            make.leading.equalTo(transitImg.snp.trailing).offset(16)
            make.top.equalTo(transitImg).offset(8)
        }
         
        
        addSubview(transitInfoLbl)
        transitInfoLbl.textColor = .primaryGray
        transitInfoLbl.font = Font.textField()
        transitInfoLbl.snp.makeConstraints { make in
            make.leading.equalTo(transitLbl)
            make.bottom.equalTo(transitImg).offset(-8)
        }
       
        addSubview(caseLabel)
        caseLabel.textColor = .secondaryGreen
        caseLabel.backgroundColor = .primaryLightBack
        caseLabel.layer.cornerRadius = 10
        caseLabel.layer.masksToBounds = true
        caseLabel.textAlignment = .center
        caseLabel.font = Font.custom(size: 12, fontWeight: .medium)
        caseLabel.snp.makeConstraints { make in
            make.centerY.equalTo(transitImg)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(32)
            make.width.equalTo(80)
        }
                
        addSubview(bigButton)
        bigButton.backgroundColor = .secondaryGreen
        bigButton.layer.cornerRadius = 24
        bigButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(48)
        }
        bigButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        /*
        addSubview(firstSmallButton)
        bigButton.backgroundColor = .secondaryGreen
        bigButton.layer.cornerRadius = 24
        bigButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(160)
            make.height.equalTo(48)
 
        }
        
        addSubview(secondSmallButton)
        bigButton.backgroundColor = .secondaryGreen
        bigButton.layer.cornerRadius = 24
        bigButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(-16)
            make.width.equalTo(160)
            make.height.equalTo(48)
 
        }
        */
         
    }
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)
    }
    
}
