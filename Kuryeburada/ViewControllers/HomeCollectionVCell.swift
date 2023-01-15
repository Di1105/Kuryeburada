//
//  HomeCollectionVCell.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 13.01.2023.
//

import UIKit
import SnapKit

class HomeCollectionVCell: UICollectionViewCell {
   
    static let identifier = "Cell"
    
    var bigButton = UIButton()
    var cellImageView = UIImageView()
    var cellHeadLabel = UILabel()
    var cellInfoLabel = UILabel()
    var timeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bigButton.addSubview(cellHeadLabel)
        bigButton.addSubview(cellInfoLabel)
        bigButton.addSubview(timeLabel)
        bigButton.addSubview(cellImageView)


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(bigButton)
        bigButton.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        bigButton.backgroundColor = .white

        
        cellImageView.layer.cornerRadius = 32
        cellImageView.layer.masksToBounds = false
        cellImageView.clipsToBounds = true
        
        cellImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview()
            make.width.height.equalTo(64)
        }



        cellHeadLabel.snp.makeConstraints { make in
            make.top.equalTo(cellImageView)
            make.leading.equalTo(cellImageView.snp.trailing).offset(16)
            make.height.equalTo(20)
        }

        
        cellInfoLabel.font = Font.labelFont()
        cellInfoLabel.textColor = .primaryGray
        cellInfoLabel.lineBreakMode = .byCharWrapping
        cellInfoLabel.numberOfLines = 3
        cellInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(cellHeadLabel.snp.bottom).offset(8)
            make.leading.equalTo(cellHeadLabel)
            make.width.equalTo(160)
        }

        
        bigButton.addSubview(timeLabel)
        timeLabel.font = Font.labelFont()
        timeLabel.textColor = .secondaryGreen
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cellImageView)
            make.trailing.equalTo(bigButton.snp.trailing)
            make.height.equalTo(20)
        }

        
      

    }
    
    
    
}


