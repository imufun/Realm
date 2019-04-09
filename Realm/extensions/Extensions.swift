//
//  Extensions.swift
//  Realm
//
//  Created by sinbad on 4/9/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

extension UITextField {
    //  var insets:UIEdgeInsets!
    
    convenience init(frame: CGRect = .zero, placeholder:String = "placeholder", radius:CGFloat = 4) {
        self.init(frame: .zero)
        
        self.placeholder = placeholder
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = radius
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.borderColor  = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        //  self.insets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
        self.textColor = UIColor.gray
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    /// set icon of 20x20 with left padding of 8px
    func setLeftIcon(_ icon: UIImage) {
        
        let padding = 16
        let size = 20
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding+10, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = icon
        outerView.addSubview(iconView)
        
        leftView = outerView
        leftViewMode = .always
    }
}
