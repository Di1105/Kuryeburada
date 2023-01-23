//
//  CustomProfileVCButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 20.01.2023.
//

import UIKit

class CustomProfileVCButton: UIButton {

    lazy var buttonIconLeft = UIImageView()
    lazy var buttonLabel = UILabel()
    lazy var buttonIconRight = UIImageView()
    lazy var buttonLabelSec = UILabel()
    lazy var switchView = UISwitch()
    lazy var destinationViewController = UIViewController()
    lazy var currentViewController = UIViewController()


    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(buttonImage: String, buttonText: String, buttonLeftImage: String, secondText: String, currentVC: UIViewController, destinationVC: UIViewController){
        super.init(frame: .zero)
        configureUI()
        buttonIconLeft.image = UIImage(named: buttonImage)
        buttonLabel.text = buttonText
        buttonIconRight.image = UIImage(named: buttonLeftImage)
        buttonLabelSec.text = secondText
        switchView.isHidden = true
        self.destinationViewController = destinationVC
        self.currentViewController = currentVC
    }
    
    init(buttonImage: String, buttonText: String, switchHide: Bool,  currentVC: UIViewController, destinationVC: UIViewController ){
        super.init(frame: .zero)
        configureUI()
        buttonIconLeft.image = UIImage(named: buttonImage)
        buttonLabel.text = buttonText
        switchView.isHidden = switchHide
        self.destinationViewController = destinationVC
        self.currentViewController = currentVC
        
    }
    
    
    private func configureUI(){
        
        backgroundColor = .white
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        addSubview(buttonIconLeft)
        buttonIconLeft.tintColor = .primaryDarkBlue
        buttonIconLeft.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
        
        addSubview(buttonLabel)
        buttonLabel.textColor = .primaryDarkBlue
        buttonLabel.snp.makeConstraints { make in
            make.leading.equalTo(buttonIconLeft.snp.trailing).offset(8)
            make.centerY.equalTo(buttonIconLeft)
        }
        
        addSubview(buttonIconRight)
        buttonIconRight.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalTo(buttonIconLeft)
        }
        
        addSubview(buttonLabelSec)
        buttonLabelSec.textColor = .primaryDarkBlue
        buttonLabelSec.snp.makeConstraints { make in
            make.trailing.equalTo(buttonIconRight.snp.leading).offset(-8)
            make.centerY.equalTo(buttonIconLeft)
        }
        
        addSubview(switchView)
        switchView.setOn(false, animated: false)
        switchView.onTintColor = .secondaryGreen
        switchView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalTo(buttonIconLeft)
        }
        switchView.addTarget(self, action: #selector(switchTapped), for: .valueChanged)
        
    }
    @objc func switchTapped(){
    //    buttonLabel.textColor = switchView.isOn ? //.secondaryGreen : .primaryDarkBlue
        buttonIconLeft.tintColor = switchView.isOn ? .primaryGreen : .primaryDarkBlue
    }
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)
    }
    
}
