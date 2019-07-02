//
//  CustomLabelClass.swift
//  MVCTutorial
//
//  Created by Anil Kumar on 28/06/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

final class CustomLabelClass: UILabel {
    private let title: String
    private let textStyle: UIFont.TextStyle
    
    init(title: String, textStyle: UIFont.TextStyle) {
        self.title     = title
        self.textStyle = textStyle
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        text          = title
        textColor     = .white
        textAlignment = .center
        font          = .preferredFont(forTextStyle: textStyle)
    }
}
