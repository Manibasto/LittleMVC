//
//  secondViewController.swift
//  Task
//
//  Created by Anil Kumar on 02/07/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import UIKit

var favouriteArray: [String] = []
class secondViewController: UIViewController {
  
  lazy var id: UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.textAlignment = NSTextAlignment.center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  lazy var name: UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.textAlignment = NSTextAlignment.center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  lazy var image: UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.textAlignment = NSTextAlignment.center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  lazy var Age: UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.textAlignment = NSTextAlignment.center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  
  lazy var salary: UILabel = { [unowned self] in
    let label = UILabel()
    label.textColor = UIColor.black
    label.textAlignment = NSTextAlignment.center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  lazy var fav: UIButton = { [unowned self] in
    let btn = UIButton()
    btn.setTitleColor(.black, for: .normal)
    btn.layer.borderWidth = 1
    btn.layer.borderColor = UIColor.lightGray.cgColor
    btn.setTitle("Favourite", for: .normal)
    btn.addTarget(self, action: #selector(favClicked), for: .touchUpInside)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Employee Details"
    
    view.backgroundColor = .white
    
    view.addSubview(id)
    view.addSubview(name)
    view.addSubview(image)
    view.addSubview(Age)
    view.addSubview(salary)
    view.addSubview(fav)
    
    id.layoutAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 100, paddingLeft: 10, paddingBottom: 0.0, paddingRight: 10, width: 0.0, height: 0.0, enableInsets: true)
    
    
    name.layoutAnchor(top: id.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0.0, paddingRight: 10, width: 0.0, height: 0.0, enableInsets: true)
    
    
    image.layoutAnchor(top: name.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0.0, paddingRight: 10, width: 0.0, height: 0.0, enableInsets: true)
    
    
    Age.layoutAnchor(top: image.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0.0, paddingRight: 10, width: 0.0, height: 0.0, enableInsets: true)
    
    
    salary.layoutAnchor(top: Age.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0.0, paddingRight: 10, width: 0.0, height: 0.0, enableInsets: true)
    
    
    fav.layoutAnchor(top: salary.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: salary.centerXAnchor, centerY: nil, paddingTop: 100, paddingLeft: 10, paddingBottom: 0.0, paddingRight: 10, width: 100, height: 50, enableInsets: true)
    
    if favouriteArray.contains(empId) {
      fav.backgroundColor = UIColor.blue
      fav.setTitleColor(.white, for: .normal)
      fav.layer.borderWidth = 1
      fav.layer.borderColor = UIColor.white.cgColor
    }else{
      fav.backgroundColor = UIColor.white
      fav.setTitleColor(.black, for: .normal)
      fav.layer.borderWidth = 1
      fav.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    id.text = "ID: \(empId)"
    name.text = "Employee Name: \(empName)"
    image.text = "Employee Image: \(empImage)"
    Age.text = "Employee Age: \(empAge)"
    salary.text = "Employee Salary: \(empSalary)"
    
    
  }
  
  @objc func favClicked(){
    favouriteArray.append(empId)
    fav.backgroundColor = UIColor.blue
    fav.setTitleColor(.white, for: .normal)
    fav.layer.borderWidth = 1
    fav.layer.borderColor = UIColor.white.cgColor
  }
}

