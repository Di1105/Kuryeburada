//
//  CustomIntroLabel.swift
//  Kuryeburada
//
//  Created by Dilara Elçioğlu on 9.01.2023.
//

import UIKit

class CustomIntroLabel: UILabel {
    
    enum LabelColor {
        case Yellow
        case DarkBlue
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text : String, color: LabelColor ) {
        super.init(frame: .zero)
        configureUI()
        self.text = text
        self.textColor = labelColor(labelColor: color)
    }
    
   private func labelColor(labelColor: LabelColor ) -> UIColor {
       return UIColor(named: "primary\(labelColor)") ?? .black
   }

    func configureUI(){
        
            snp.makeConstraints { make in
            make.height.equalTo(64)
        }
        font = Font.IntroNormal()
        textAlignment = .center
        lineBreakMode = .byCharWrapping
        numberOfLines = 0
    }
   
}
