//
//  CustomTrackView.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 16.01.2023.
//

import UIKit

class CustomTrackView: UIView {
    lazy var headImg = UIImageView()
    lazy var firstLabel = UILabel()
    lazy var secondLabel = UILabel()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(headImage: String, firstText: String, secondText: String){
        super.init(frame: .zero)
        configureUI()
        headImg.image = UIImage(named: "\(headImage)")
        firstLabel.text = firstText
        secondLabel.text = secondText
    }
    
    private func configureUI(){
        
        backgroundColor = .white
        snp.makeConstraints { make in
            make.height.equalTo(120)
        }
        
        addSubview(headImg)
        headImg.layer.cornerRadius = 24
        headImg.layer.masksToBounds = false
        headImg.clipsToBounds = true
        headImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(48)
        }
        
        addSubview(firstLabel)
        firstLabel.font = Font.header3()
        firstLabel.textAlignment = .center
        firstLabel.textColor = .primaryDarkBlue
        firstLabel.snp.makeConstraints { make in
            make.top.equalTo(headImg.snp.bottom).offset(8)
            make.centerX.equalTo(headImg)
        }
        
        addSubview(secondLabel)
        secondLabel.font = Font.labelFont()
        secondLabel.textAlignment = .center
        secondLabel.textColor = .primaryGray
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(8)
            make.centerX.equalTo(firstLabel)
        }
       
    }

}
