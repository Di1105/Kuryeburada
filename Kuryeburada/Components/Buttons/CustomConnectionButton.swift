//
//  CustomConnectionButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 10.01.2023.
//

import UIKit

class CustomConnectionButton: UIButton {
    
    enum Connection {
        case facebook
        case google
        case appleID
    }
    

    var destinationViewController = UIViewController()
    var currentViewController = UIViewController()
    var buttonImage = UIImageView()
    var buttonTitle = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.buttonTitle.text = title
        configureUI()
    }
    
    init(connectionLogo: String, currentVC: UIViewController, destinationVC : UIViewController) {
        super.init(frame: .zero)
        configureUI()
        destinationViewController = destinationVC
        currentViewController = currentVC
        buttonImage.image = UIImage(named: connectionLogo)
    }
    
    init(connection: String, currentVC: UIViewController, destinationVC : UIViewController) {
        super.init(frame: .zero)
        configureUI()
        destinationViewController = destinationVC
        currentViewController = currentVC
        buttonImage.image = UIImage(named: connection)
        buttonTitle.text = "Continue with \(connection)"
    }
    
    private func configureUI() {
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        addSubview(buttonTitle)
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        backgroundColor = .white
        buttonTitle.numberOfLines = 2
        buttonTitle.textColor = .primaryGray
        buttonTitle.font = Font.labelFont()
        buttonTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
        
        addSubview(buttonImage)
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        buttonImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(buttonTitle.snp.leading).offset(-16)
        }
        
        
        snp.makeConstraints { make in
            make.height.equalTo(56)
            make.width.equalTo(100)
        }
        
    }
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)
    }
    
}

