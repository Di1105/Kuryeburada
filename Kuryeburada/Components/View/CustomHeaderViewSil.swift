//
//  CustomHeader.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 7.01.2023.
//

import UIKit
import SnapKit

class CustomHeaderViewSil: UIView {
    
    lazy var accountHeader = UILabel()
    lazy var destinationViewController = UIViewController()
    lazy var currentViewController = UIViewController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String, currentVC: UIViewController, destinationVC : UIViewController) {
        super.init(frame: .zero)
        configure()
        accountHeader.text = text
        destinationViewController = destinationVC
        currentViewController = currentVC
    }
    
    
    private func configure(){
        
        snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        backgroundColor = .white
        
        lazy var backButton = UIButton()
        backButton.setImage(UIImage(named: "left"), for: .normal)
        backButton.tintColor = .primaryGray
        addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        accountHeader.font = Font.header1()
        accountHeader.textColor = .primaryDarkBlue
        addSubview(accountHeader)
        accountHeader.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(backButton)
        }
                
    }
    
    @objc func backButtonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .left)

    }
    
    
    
}
