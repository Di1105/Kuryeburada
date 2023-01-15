//
//  CustomConnectionSmallButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 15.01.2023.
//

import UIKit

class CustomConnectionSmallButton: UIButton {

    enum Connection {
        case Facebook
        case Google
        case AppleID
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
    
    init(connectionLogo: Connection, currentVC: UIViewController, destinationVC : UIViewController) {
        super.init(frame: .zero)
        configureUI()
        destinationViewController = destinationVC
        currentViewController = currentVC
        buttonImage.image = UIImage(named: "\(connectionLogo)")
    }
    

    private func configureUI() {
        
        backgroundColor = .white
        layer.cornerRadius = 28
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        snp.makeConstraints { make in
            make.height.equalTo(56)
            make.width.equalTo(80)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        addSubview(buttonImage)
        buttonImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
    }
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)
    }
    
}

