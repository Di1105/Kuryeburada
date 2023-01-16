//
//  CollectionTopCell.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 16.01.2023.
//

import UIKit

class CollectionTopCell: UICollectionViewCell {
  static let identifier = "TopCell"

  var collectionButton = UIButton()

  override init(frame: CGRect) {
      super.init(frame: frame)
     
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
      super.layoutSubviews()
      
      addSubview(collectionButton)
      collectionButton.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
      collectionButton.layer.borderWidth = 1
      collectionButton.clipsToBounds = true
      collectionButton.layer.cornerRadius = 15
      collectionButton.backgroundColor = .white
      collectionButton.layer.borderColor = UIColor.secondaryGreen?.cgColor
      collectionButton.setTitleColor(.secondaryGreen, for: .normal)
      //font değiştirme?
      collectionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }
    
    @objc func buttonTapped(_ sender: UIButton){
        if sender.backgroundColor == .white{
            sender.setTitleColor(.white, for: .normal)
            sender.backgroundColor = .secondaryGreen
        } else {
            sender.setTitleColor(.secondaryGreen, for: .normal)
            sender.backgroundColor = .white
        }
    }
    
}
