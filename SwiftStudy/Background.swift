//
//  Background.swift
//  SwiftStudy
//
//  Created by johnny on 7/11/19.
//  Copyright © 2019 orgname. All rights reserved.
//

//import Foundation
import UIKit

class Background: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .gray  // hex color #DBC071
    }
}
