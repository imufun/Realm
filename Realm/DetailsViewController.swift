//
//  DetailsViewController.swift
//  Realm
//
//  Created by sinbad on 4/9/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class DetailsViewController : UIViewController {
    
    let nameField:UITextField = UITextField( placeholder: "Add New Item", radius: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
        setupView()
    }
    
    func setupView(){ 
        view.addSubview(nameField)
        nameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 45))
        nameField.leftViewMode = .always
        //  nameField.addPaddingToTextField()
        //        nameField.translatesAutoresizingMaskIntoConstraints = false
        //        nameField.backgroundColor = .white
        //        nameField.layer.cornerRadius = 8
        //        nameField.layer.borderColor  = UIColor.lightGray.cgColor
        //        nameField.layer.borderWidth = 1
        self.view.addConstraints([
            //  nameField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            nameField.widthAnchor.constraint(equalToConstant: 350),
            nameField.heightAnchor.constraint(equalToConstant: 45)
            
            ])
    }
    
    
    func setupNavigation(){
        navigationItem.title = "Details"
        
        let addBtn = UIBarButtonItem(image: UIImage(named: "like"), style: .plain, target: self, action: #selector(handleSaveBtn))
        addBtn.tintColor = .white
        self.navigationItem.rightBarButtonItem = addBtn
        self.navigationController?.navigationBar.barTintColor = _ColorLiteralType(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:_ColorLiteralType(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    @objc func handleSaveBtn(){
        print("save")
    }
}
