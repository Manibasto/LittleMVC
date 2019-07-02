//
//  IdentiableCell.swift
//  MVCTutorial
//
//  Created by Anil Kumar on 01/07/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

protocol IdentifiableCell: AnyObject {
    static var identifier: String { get }
}

extension IdentifiableCell {
    static var identifier: String { return String(describing: self) }
}
