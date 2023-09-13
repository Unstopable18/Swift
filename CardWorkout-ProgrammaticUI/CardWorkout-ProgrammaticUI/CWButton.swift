//
//  CWButton.swift
//  CardWorkout-ProgrammaticUI
//
//  Created by CEMTREX on 13/09/23.
//

import UIKit

class CWButton: UIButton {

    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has bot been implemented")
    }
    
    init(color:UIColor,title:String,systemImageName:String){
        super.init(frame: .zero)
        configuration = .filled()
        configuration?.title=title
        configuration?.baseBackgroundColor = color
        configuration?.image=UIImage(systemName: systemImageName)
        configuration?.imagePadding = 5
        configuration?.cornerStyle = .medium
        
        translatesAutoresizingMaskIntoConstraints=false
    }

}
