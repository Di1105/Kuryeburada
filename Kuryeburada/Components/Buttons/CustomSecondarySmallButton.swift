//
//  CustomSecondaryLittleButton.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit
import SnapKit

class CustomSecondarySmallButton: UIButton {

    var destinationViewController = UIViewController()
    var currentViewController = UIViewController()
    
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
    
    init(title: String, currentVC: UIViewController, destinationVC : UIViewController) {
        super.init(frame: .zero)
        configureUI()
        self.buttonTitle.text = title
        destinationViewController = destinationVC
        currentViewController = currentVC
    }
    
    private func configureUI() {
        
        snp.makeConstraints { make in
            make.height.equalTo(56)
            make.width.equalTo(100)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        addSubview(buttonTitle)
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        backgroundColor = .white
        buttonTitle.numberOfLines = 2
        buttonTitle.textColor = .primaryGray
        buttonTitle.font = Font.header3()
        buttonTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
        
        
    }
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)
    }

}
