//
//  CollectionBackCell.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 16.01.2023.
//

import UIKit
import SnapKit

class MyOrderFromMeCell: UICollectionViewCell {
    
    static let identifier = "FromMeCell"
    var collectionButton = UIButton()
    lazy var collectionCellView = UIView()
    lazy var transitImg = UIImageView()
    lazy var transitLbl = UILabel()
    lazy var transitInfoLbl = UILabel()
    lazy var caseLabel = UILabel()
    lazy var receiptButton = UIButton()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        addSubview(collectionCellView)
        collectionCellView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        collectionCellView.layer.borderWidth = 1
        collectionCellView.clipsToBounds = true
        collectionCellView.layer.cornerRadius = 15
        collectionCellView.backgroundColor = .white
        collectionCellView.layer.borderColor = UIColor.secondaryGreen?.cgColor
   
   
        collectionCellView.addSubview(transitImg)
        transitImg.backgroundColor = .primaryLightBack
        transitImg.layer.masksToBounds = false
        transitImg.layer.borderColor = UIColor.primaryLightBack?.cgColor
        transitImg.layer.cornerRadius = 30
        transitImg.clipsToBounds = true
        transitImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(60)
        }
   
        collectionCellView.addSubview(transitLbl)
        transitLbl.textColor = .primaryDarkBlue
        transitLbl.font = Font.header3()
        transitLbl.snp.makeConstraints { make in
            make.leading.equalTo(transitImg.snp.trailing).offset(16)
            make.top.equalTo(transitImg)
        }
   
        collectionCellView.addSubview(transitInfoLbl)
        transitInfoLbl.textColor = .primaryGray
        transitInfoLbl.font = Font.labelFont()
        transitInfoLbl.snp.makeConstraints { make in
            make.leading.equalTo(transitImg.snp.trailing).offset(16)
            make.top.equalTo(transitImg)
        }
   
        addSubview(transitInfoLbl)
        transitInfoLbl.textColor = .primaryGray
        transitInfoLbl.font = Font.labelFont()
        transitInfoLbl.snp.makeConstraints { make in
            make.leading.equalTo(transitImg.snp.trailing).offset(16)
            make.bottom.equalToSuperview().offset(-24)
        }
   
        addSubview(caseLabel)
        caseLabel.textColor = .white
        caseLabel.backgroundColor = .secondaryGreen
        caseLabel.layer.cornerRadius = 10
        caseLabel.layer.masksToBounds = true
        caseLabel.textAlignment = .center
        caseLabel.font = Font.labelFont()
        caseLabel.snp.makeConstraints { make in
            make.centerY.equalTo(transitImg)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(32)
            make.width.equalTo(100)
        }
        
        addSubview(receiptButton)
        receiptButton.setTitle("View E-Receipt", for: .normal)
        receiptButton.layer.cornerRadius = 10
        receiptButton.layer.borderWidth = 1
        receiptButton.layer.borderColor = UIColor.secondaryGreen?.cgColor
        backgroundColor = .white
        receiptButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(56)
        }
        
    }
  
      
}

