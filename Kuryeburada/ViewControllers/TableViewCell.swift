//
//  TableViewCell.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 19.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    var cellLabel = UILabel()
    var cellLabel2 = UILabel()
    var cellImage = UIImageView()
    var cellButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellLabel)
        contentView.addSubview(cellLabel2)
        contentView.addSubview(cellImage)
        contentView.addSubview(cellButton)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        cellImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.leading.equalTo(contentView).offset(20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.width.height.equalTo(60)
        }
        cellImage.layer.cornerRadius = 30
        cellImage.backgroundColor = .blue
        
        //cellLabel.numberOfLines = 0
        cellLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(30)
            make.leading.equalTo(cellImage.snp.trailing).offset(10)
        }
        cellLabel.font = UIFont.systemFont(ofSize: 14)
        cellLabel.textColor = .black
        cellLabel.layer.cornerRadius = 20
        cellLabel.text = "Tyniha Obey"
        
        cellLabel2.snp.makeConstraints { make in
            make.top.equalTo(cellLabel.snp.bottom).offset(6)
            make.leading.equalTo(cellImage.snp.trailing).offset(12)
        }
        cellLabel2.font = UIFont.systemFont(ofSize: 14)
        cellLabel2.textColor = .gray
        cellLabel2.layer.cornerRadius = 20
        cellLabel2.text = "+1-200-3838*95"
        
        cellButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(80)
            make.centerY.equalTo(cellImage)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        cellButton.setTitle("Invite", for: .normal)
        cellButton.tintColor = .white
        cellButton.backgroundColor = UIColor(named: "GGreen")
        cellButton.layer.cornerRadius = 15
        cellButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    @objc func buttonTapped(){
        
    }

}
