//
//  DetailsViewController.swift
//  Realm
//
//  Created by sinbad on 4/9/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import RealmSwift
class DetailsViewController : UIViewController {
    
    let nameField:UITextField = UITextField( placeholder: "Name", radius: 12)
    let addressField:UITextField = UITextField(placeholder : "Address", radius: 12)
    let countryField:UITextField = UITextField(placeholder : "Country", radius: 12)
    let saveBtn:UIButton = UIButton(type: .system)
    
    
    let titleLabel:UILabel = UILabel(text: "Real Database", font: UIFont.boldSystemFont(ofSize: 20))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
        setupView()
        
        
    }
    
    func setupView(){
        view.addSubview(addressField)
        view.addSubview(countryField)
        view.addSubview(nameField)
        
        view.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        
        let viewOne = UIView()
        let leftNameIcon =  UIImage(named: "like")
        let letAddressIcon = UIImage(named: "like")
        let leftCountry = UIImage(named: "like")
        nameField.setLeftIcon(leftNameIcon!)
        addressField.setLeftIcon(letAddressIcon!)
        countryField.setLeftIcon(leftCountry!)
        
        view.addSubview(saveBtn)
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.backgroundColor = .red
        saveBtn.layer.cornerRadius = 12
        saveBtn.center.y = self.view.center.y
        saveBtn.addTarget(self, action: #selector(handleSaveData), for: .touchUpInside)
        
        view.addSubview(viewOne)
        let textFieldWidth = 360
        
        self.view.addConstraints([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            nameField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            nameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            nameField.widthAnchor.constraint(equalToConstant: CGFloat(textFieldWidth)),
            nameField.heightAnchor.constraint(equalToConstant: 45),
            
            addressField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            addressField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            addressField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            addressField.widthAnchor.constraint(equalToConstant: CGFloat(textFieldWidth)),
            addressField.heightAnchor.constraint(equalToConstant: 45),
            
            countryField.topAnchor.constraint(equalTo: addressField.bottomAnchor, constant: 20),
            countryField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            countryField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            countryField.widthAnchor.constraint(equalToConstant: CGFloat(textFieldWidth)),
            countryField.heightAnchor.constraint(equalToConstant: 45),
            
            
            saveBtn.topAnchor.constraint(equalTo: countryField.bottomAnchor, constant: 20),
//            saveBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            saveBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            saveBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            saveBtn.widthAnchor.constraint(equalToConstant: 150),
            saveBtn.heightAnchor.constraint(equalToConstant: 45),
            ])
    }
    
    
    func setupNavigation(){
        navigationItem.title = "Details"
        
        let addBtn = UIBarButtonItem(image: UIImage(named: "like"), style: .plain, target: self, action: #selector(handleFavItem))
        addBtn.tintColor = .white
        self.navigationItem.rightBarButtonItem = addBtn
        self.navigationController?.navigationBar.barTintColor = _ColorLiteralType(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:_ColorLiteralType(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    @objc func handleFavItem(){
        print("fav")
    }
    
    @objc func handleSaveData(){
        
        let nameTextField = self.nameField.text
        let addTextField = self.addressField.text
        let countryTextField = self.countryField.text
        
        if (nameTextField?.isEmpty)! {
            self.nameField.layer.borderColor = UIColor.red.cgColor
            return
        } else {
            self.nameField.layer.borderColor = UIColor.black.cgColor
        }
        if (addTextField?.isEmpty)! {
            self.addressField.layer.borderColor = UIColor.red.cgColor
            return
        } else {
            self.addressField.layer.borderColor = UIColor.black.cgColor
        }
        
        if (countryTextField?.isEmpty)! {
            self.countryField.layer.borderColor = UIColor.red.cgColor
            return
        } else {
            self.countryField.layer.borderColor = UIColor.black.cgColor
        }
        
        let person = Person()
        person.setValue(self.nameField.text, forKey: "name")
        person.setValue(self.addressField.text, forKey: "address")
        person.setValue(self.countryField.text, forKey: "city")
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(person)
                print("save: \(person)")
                self.nameField.text = ""
                self.addressField.text = ""
                self.countryField.text = ""
            }
        } catch {
            print("error")
        }
        
        print("save")
    }
  
}
