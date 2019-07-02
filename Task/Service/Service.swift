//
//  Service.swift
//  Task
//
//  Created by Anil Kumar on 02/07/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import Foundation

class Networking: NSObject {
  private static var privateSharedInstance: Networking?
  static var sharedInstance: Networking {
    if privateSharedInstance == nil {
      privateSharedInstance = Networking()
    }
    return privateSharedInstance!
  }
  
  func apiRequest(completion:@escaping ( _ success:Bool,  _ error:String, _ result: employee) -> Void) {
    
    guard let url = URL(string: url) else { return }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let dataResponse = data, error == nil else {
        completion(false,error?.localizedDescription ?? "Response Error", [])
        return }
      do {
        let decoder = JSONDecoder()
        let model = try decoder.decode(employee.self, from: dataResponse)
        completion(true,"",model)
      } catch let parsingError {
        completion(false,parsingError as? String ?? "Error", [])
      }
    }
    task.resume()
  }
}

