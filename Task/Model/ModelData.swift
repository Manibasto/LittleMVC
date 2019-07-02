//
//  ModelData.swift
//  Task
//
//  Created by Anil Kumar on 02/07/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import Foundation

// MARK: - EmployeeDetails
struct EmployeeDetails: Codable {
  let id, employeeName, employeeSalary, employeeAge: String
  let profileImage: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case employeeName = "employee_name"
    case employeeSalary = "employee_salary"
    case employeeAge = "employee_age"
    case profileImage = "profile_image"
  }
}
