//
//  CustomButton.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 5.01.2023.
//

import UIKit
import SnapKit

class CustomPrimaryLargeButton: UIButton {
    
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
        self.destinationViewController = destinationVC
        self.currentViewController = currentVC
    }
    
    private func configureUI() {
        
        backgroundColor = .primaryGreen
        layer.cornerRadius = 10
        snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)


        addSubview(buttonTitle)
        buttonTitle.numberOfLines = 2
        buttonTitle.textColor = .white
        buttonTitle.font = Font.header3()
        buttonTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
       
        
    }
    
    @objc func buttonTapped(){
        Presentation.presentVC(currentVC: currentViewController, destinationVC: destinationViewController, toDirection: .right)
    }
    

}
