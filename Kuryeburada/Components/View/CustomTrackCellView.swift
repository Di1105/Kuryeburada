//
//  CustomProfileCellView.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 19.01.2023.
//

import UIKit
import SnapKit

class CustomTrackCellView: UIView {

    lazy var destinationViewController = UIViewController()
    lazy var currentViewController = UIViewController()
    lazy var profileImage = UIImageView()
    lazy var iconImage = UIImageView()
    lazy var leftHeader = UILabel()
    lazy var InfoLabel = UILabel()
    lazy var secondButton = UIButton()
    lazy var oneButton = UIButton()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(profileImage: String, profileName: String, messageText: String, secondButtonName: String, oneButtonName: String, currentVC: UIViewController, destinationVC: UIViewController){
        super.init(frame: .zero)
        configureUI()
        self.profileImage.image = UIImage(named: "\(profileImage)")
        leftHeader.text = profileName
        InfoLabel.text = messageText
        secondButton.setImage(UIImage(named: secondButtonName), for: .normal)
        oneButton.setImage(UIImage(named: oneButtonName), for: .normal)
        destinationViewController = destinationVC
        currentViewController = currentVC
    }
    
    init(iconImage: String, profileName: String, messageText: String, secondButtonName: String, oneButtonName: String, currentVC: UIViewController, destinationVC: UIViewController){
        super.init(frame: .zero)
        configureUI()
        self.iconImage.image = UIImage(named: "\(iconImage)")
        leftHeader.text = profileName
        InfoLabel.text = messageText
        self.secondButton.setImage(UIImage(named: secondButtonName), for: .normal)
        self.oneButton.setImage(UIImage(named: oneButtonName), for: .normal)
        destinationViewController = destinationVC
        currentViewController = currentVC
    }
    
    
    private func configureUI(){
        
        backgroundColor = .white
        snp.makeConstraints { make in
            make.height.equalTo(92)
        }
        
        addSubview(profileImage)
        profileImage.layer.cornerRadius = 30
        profileImage.layer.masksToBounds = false
        profileImage.clipsToBounds = true
        profileImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(60)
        }
        
        addSubview(iconImage)
        iconImage.layer.cornerRadius = 15
        iconImage.layer.masksToBounds = false
        iconImage.clipsToBounds = true
        iconImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }
        
        addSubview(leftHeader)
        leftHeader.font = .systemFont(ofSize: 20)
        leftHeader.textColor = .black
        leftHeader.layer.cornerRadius = 20
        leftHeader.text = "........"
        leftHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalTo(profileImage.snp.trailing).offset(10)
        }

        
        addSubview(InfoLabel)
        InfoLabel.font = UIFont.systemFont(ofSize: 14)
        InfoLabel.textColor = .gray
        InfoLabel.layer.cornerRadius = 20
        InfoLabel.text = "..............."
        InfoLabel.snp.makeConstraints { make in
            make.top.equalTo(leftHeader.snp.bottom).offset(6)
            make.leading.equalTo(profileImage.snp.trailing).offset(12)
        }

        
        addSubview(oneButton)
        oneButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileImage)
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(32)
        }
        oneButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        addSubview(secondButton)
        secondButton.snp.makeConstraints { make in
            make.centerY.equalTo(oneButton)
            make.width.height.equalTo(32)
            make.trailing.equalTo(oneButton.snp.leading).offset(-16)
        }
        secondButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        

        
    }
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)
    }
    
}
