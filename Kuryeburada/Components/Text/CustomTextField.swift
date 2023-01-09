//
//  CustomTextField.swift
//  Geyim Burada
//
//  Created by Dilara Elçioğlu on 5.01.2023.
//

import UIKit
import SnapKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder : String ) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configureUI()
        
    }
    
    init(placeholder : String, leftImgName : String ) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configureUI()
        self.setupLeftImage(imageName: leftImgName)
    }
    
    init(placeholder : String, leftImgName : String , isSecureText: Bool ) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configureUI()
        self.setupLeftImage(imageName: leftImgName)
        self.set(isSecureText: isSecureText)
    }
    
    
    func configureUI(){
        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryGray?.cgColor
        backgroundColor = .white
        font = Font.textField()
        textColor = .primaryDarkBlue
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: self.frame.size.height))
        leftView = paddingView
        leftViewMode = .always
        addTarget(self, action: #selector(nameFieldDidChange), for: .editingChanged)

    }
    
    @objc func nameFieldDidChange(_ sender: Any) {
        if (self.text!.isEmpty)
        {
            self.layer.borderColor = UIColor.primaryGray?.cgColor
        }
        else
        {
            self.layer.borderColor = UIColor.primaryGreen?.cgColor
        }
    }
    
    private func set(isSecureText : Bool){
        isSecureTextEntry = isSecureText
    }
    
    private func setupLeftImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 24, height: 24))
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
        imageView.tintColor = .primaryGreen
    }
}
