//
//  CustomBottomSignButton.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 10.01.2023.
//

import UIKit

class CustomBottomSignButton: UIButton {
    
    var destinationViewController = UIViewController()
    var currentViewController = UIViewController()
    
    var buttonTitle = UILabel()
    var buttonTitle2 = UILabel()

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
    
    init(buttonText: String, labelText: String, currentVC: UIViewController, destinationVC : UIViewController) {
        super.init(frame: .zero)
        configureUI()
        self.buttonTitle2.text = buttonText
        buttonTitle.text = labelText
        destinationViewController = destinationVC
        currentViewController = currentVC
    }
    
    private func configureUI() {
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(240)
        }
        
        addSubview(buttonTitle)
        buttonTitle.numberOfLines = 2
        buttonTitle.textColor = .primaryGray
        buttonTitle.font = Font.labelFont()
        buttonTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        addSubview(buttonTitle2)
        buttonTitle2.textColor = .primaryGreen
        buttonTitle2.font = Font.labelFont()
        buttonTitle2.snp.makeConstraints { make in
            make.leading.equalTo(buttonTitle.snp.trailing).offset(4)
        }
        
    }
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)
    }
}
