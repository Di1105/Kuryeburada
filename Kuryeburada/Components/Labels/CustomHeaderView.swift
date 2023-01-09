//
//  CustomHeader.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 7.01.2023.
//

import UIKit
import SnapKit

class CustomHeaderView: UIView {
    
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
            make.height.equalTo(120)
        }
        
        lazy var backButton = UIButton()
        backButton.setImage(UIImage(named: "Left"), for: .normal)
        backButton.tintColor = .darkGray
        addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(32)
        }
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        accountHeader.font = Font.header1()
        accountHeader.textColor = .primaryDarkBlue
        addSubview(accountHeader)
        accountHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
        }
        
       
        
    }
    
    @objc func backButtonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)

    }
    
    
    
}
