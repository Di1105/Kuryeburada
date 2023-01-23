//
//  CustomBasicButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 21.01.2023.
//

import UIKit

class CustomBasicButton: UIButton {

    lazy var buttonLabel = UILabel()
    lazy var rightIcon = UIImageView()
    lazy var destinationViewController = UIViewController()
    lazy var currentViewController = UIViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(labelText: String, buttonIcon: String){
        super.init(frame: .zero)
        configureUI()
        buttonLabel.text = labelText
        rightIcon.image = UIImage(named: buttonIcon)

    }
    
    init(labelText: String, buttonIcon: String, currentVC: UIViewController, destinationVC: UIViewController){
        super.init(frame: .zero)
        configureUI()
        buttonLabel.text = labelText
        rightIcon.image = UIImage(named: buttonIcon)
        self.destinationViewController = destinationVC
        self.currentViewController = currentVC

    }
    
    private func configureUI(){
        
        backgroundColor = .white
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        addSubview(buttonLabel)
        buttonLabel.textColor = .primaryDarkBlue
        buttonLabel.font = Font.labelFont()
        buttonLabel.textColor = .primaryDarkBlue
        buttonLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }

        addSubview(rightIcon)
        rightIcon.tintColor = .darkGray
        rightIcon.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
    }

    
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)
    }
        

}
