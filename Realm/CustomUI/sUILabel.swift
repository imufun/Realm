//
//  sUILabel.swift
//  Realm
//
//  Created by sinbad on 4/10/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init (text: String, color: UIColor = .black, font: UIFont, size:CGFloat = 16, textAlign:NSTextAlignment = .left){
        self.init(frame: .zero)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = text
        self.textColor = color
        self.font = font
    }
}
