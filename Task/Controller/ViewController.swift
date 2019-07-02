//
//  ViewController.swift
//  Task
//
//  Created by Anil Kumar on 02/07/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let mainTableView = UITableView()
  
  var user = employee()
  /// View which contains the loading text and the spinner
  let loadingView = UIView()
  
  /// Spinner shown during load the TableView
  let spinner = UIActivityIndicatorView()
  
  /// Text shown during load the TableView
  let loadingLabel = UILabel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Employee"
    
    view.addSubview(mainTableView)
    mainTableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifier)
    mainTableView.translatesAutoresizingMaskIntoConstraints = false
    mainTableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
    mainTableView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 0).isActive = true
    mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = true
    mainTableView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: 0).isActive = true
    fetchAPiCall()
    mainTableView.dataSource = self
    mainTableView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if !favouriteArray.isEmpty {
      mainTableView.reloadData()
    }
  }
  
  
  func fetchAPiCall(){
    setLoadingScreen()
    Networking.sharedInstance.apiRequest { (status, error, ModelResponse) in
      if status {
        self.user = ModelResponse
        DispatchQueue.main.async {
          self.mainTableView.reloadData()
          self.removeLoadingScreen()
        }
      }else {
        self.showConfirmAlert(title: "", message: error, buttonTitle: "Ok", buttonStyle: .default, confirmAction: nil)
      }
    }
  }
}
extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
    let empName1 = self.user.map {($0.employeeName)}
    let empId1 = self.user.map {($0.id)}
    let empImage1 = self.user.map {($0.profileImage)}
    let empAge1 = self.user.map {($0.employeeAge)}
    let empSalary1 = self.user.map {($0.employeeSalary)}        
    
    empName = empName1[indexPath.row]
    empId = empId1[indexPath.row]
    empImage = empImage1[indexPath.row]
    empAge = empAge1[indexPath.row]
    empSalary = empSalary1[indexPath.row]
    
    let controller = secondViewController()
    navigationController?.pushViewController(controller, animated: true)
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if !user.isEmpty {
      tableView.setEmptyMessage("")
     return user.count
    }else{
      tableView.setEmptyMessage("No dataFound")
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as? EmployeeTableViewCell
    tableView.separatorStyle = .singleLine
    DispatchQueue.global(qos: .background).async {
      DispatchQueue.main.async {
        
        if !favouriteArray.isEmpty {
          let empName = self.user.map {($0.employeeName)}
          let empId = self.user.map {($0.id)}
          
          if favouriteArray.contains(empId[indexPath.row]) {
            cell?.backgroundColor = UIColor.yellow
          }else{
             cell?.backgroundColor = UIColor.clear
          }
          cell?.textLabel?.text = "Employee Name: \(empName[indexPath.row])"
        }else{
          let empName = self.user.map {($0.employeeName)}
          cell?.textLabel?.text = "Employee Name: \(empName[indexPath.row])"
        }
        
        
      }
    }
    return cell!
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}

extension ViewController {
  // Set the activity indicator into the main view
  private func setLoadingScreen() {
    
    // Sets the view which contains the loading text and the spinner
    let width: CGFloat = 30
    let height: CGFloat = 30
    let x = (mainTableView.frame.width / 2) - (width / 2)
    let y = (mainTableView.frame.height / 2) - (height / 2) - (navigationController?.navigationBar.frame.height)!
    loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
    
    // Sets loading text
    // loadingLabel.textColor = .gray
    // loadingLabel.textAlignment = .center
    // loadingLabel.text = "Loading..."
    // loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
    
    // Sets spinner
    spinner.style = .gray
    spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    spinner.startAnimating()
    
    // Adds text and spinner to the view
    loadingView.addSubview(spinner)
    // loadingView.addSubview(loadingLabel)
    mainTableView.setEmptyMessage("")
    mainTableView.addSubview(loadingView)
    
  }
  
  // Remove the activity indicator from the main view
  private func removeLoadingScreen() {
    
    // Hides and stops the text and the spinner
    spinner.hidesWhenStopped = true
    spinner.stopAnimating()
    spinner.isHidden = true
    // loadingLabel.isHidden = true
    
  }
}

