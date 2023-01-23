//
//  CustomNotificationView.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 20.01.2023.
//

import UIKit

class CustomNotificationButton: UIButton {

    lazy var notificLabel = UILabel()
    lazy var switchView = UISwitch()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(labelText: String){
        super.init(frame: .zero)
        configureUI()
        notificLabel.text = labelText
    }
    
    private func configureUI(){
        
        backgroundColor = .white
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        addSubview(notificLabel)
        notificLabel.textColor = .primaryDarkBlue
        notificLabel.font = Font.labelFont()
        notificLabel.textColor = .primaryDarkBlue
        notificLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
        
        addSubview(switchView)
        switchView.setOn(false, animated: false)
        switchView.onTintColor = .secondaryGreen
        switchView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalTo(notificLabel)
        }
        switchView.addTarget(self, action: #selector(switchTapped), for: .valueChanged)
        
    }
    @objc func switchTapped(){
       // notificLabel.textColor = switchView.isOn ? .primaryGray : .primaryDarkBlue
        
    }
    
    @objc func buttonTapped(){
        switch switchView.isOn{
        case false:
            switchView.isOn = true
        case true:
            switchView.isOn = false
        }
    }
        

}
