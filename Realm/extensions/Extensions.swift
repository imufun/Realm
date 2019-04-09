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
    // text margin left
    //    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    //     //   return UIEdgeInsetsInsetRect(bounds, self.insets)
    //    }
    //    //    override func textRect(forBounds bounds: CGRect) -> CGRect {
    //    //        return UIEdgeInsetsInsetRect(bounds, self.insets)
    //    //    }
    //
    //    override func editingRect(forBounds bounds: CGRect) -> CGRect {
    //       // return  UIEdgeInsetsInsetRect(bounds, self.insets)
    //    }
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
}
