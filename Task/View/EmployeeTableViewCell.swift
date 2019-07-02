//
//  SecondTableViewCell.swift
//  MVCTutorial
//
//  Created by Anil Kumar on 01/07/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
  
  lazy var headerLabel: CustomLabelClass = { [unowned self] in
    let label = CustomLabelClass(title: "", textStyle: .headline)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
  
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  
  private func setup() {
    selectionStyle = .none
    
    contentView.addSubview(headerLabel)
    
    let guide = contentView.layoutMarginsGuide
    let edgePadding: CGFloat = 16
    NSLayoutConstraint.activate([
      headerLabel.topAnchor.constraint(equalTo: guide.topAnchor),
      headerLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: edgePadding),
      headerLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -edgePadding),
      headerLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
      ])
  }
}
extension EmployeeTableViewCell: IdentifiableCell {}
