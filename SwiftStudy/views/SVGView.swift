//
//  SVGView.swift
//  SwiftStudy
//
//  Created by johnny on 7/16/19.
//  Copyright © 2019 orgname. All rights reserved.
//

import Foundation
import UIKit
import SwiftSVG

class SVGView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        
        let nav_bg = UIView(SVGData: "<svg ><g><rect x=\"0\" y=\"0\" width=\"10\" height=\"10\" style=\"fill-opacity:0.5;\"/></g></svg>".data(using: String.Encoding.utf8)!)
        
        //nav_bg.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nav_bg)
        
        //nav_bg.removeConstraints(nav_bg.constraints)
        NSLayoutConstraint.activate([
            nav_bg.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            nav_bg.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            nav_bg.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            //nav_bg.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            nav_bg.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
}
