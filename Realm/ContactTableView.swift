//
//  ViewController.swift
//  Realm
//
//  Created by sinbad on 4/8/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import RealmSwift
class ContactTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let CELL = "CELL"
    
    let list = ["A", "B","C","D","E","F", "G",""]
    
    var person = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupNavigation()
        setupTableView()
        
        fetchData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func setupNavigation(){
        navigationItem.title = "Home"
        
        let addBtn = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(handleAddBtn))
        addBtn.tintColor = .white
        self.navigationItem.rightBarButtonItem = addBtn
        self.navigationController?.navigationBar.barTintColor = _ColorLiteralType(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:_ColorLiteralType(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    
    
    @objc func handleAddBtn(){
        let newViewController = DetailsViewController() 
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL) 
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        self.view.addConstraints([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
            ])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL, for: indexPath)
        let data = person[indexPath.row]
        cell.textLabel?.text = data.name
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let prs = person[indexPath.row]
        
        let realm = try! Realm()
        
        do {
            try realm.write {
                realm.delete(prs)
                person.remove(at: indexPath.row)
            }
            
        } catch {
            print(error)
        }
        
        tableView.reloadData()
    }
    
    
    
    func fetchData(){
        let realm = try! Realm()
        person = Array(realm.objects(Person.self))
        for persons in person {
            print(persons.name)
        }
    }
}
