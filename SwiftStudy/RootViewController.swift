//
//  RootViewController.swift
//  SwiftStudy
//
//  Created by johnny on 7/11/19.
//  Copyright © 2019 orgname. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let background_view = Background()
        background_view.translatesAutoresizingMaskIntoConstraints = false
        self.view = background_view
        
        let custom_view = SVGView()
        custom_view.translatesAutoresizingMaskIntoConstraints = false
        var current_view = custom_view
        self.view.addSubview(current_view)
        
        NSLayoutConstraint.activate([
            current_view.topAnchor.constraint(equalTo: background_view.safeAreaLayoutGuide.topAnchor),
            current_view.leadingAnchor.constraint(equalTo: background_view.safeAreaLayoutGuide.leadingAnchor),
            current_view.trailingAnchor.constraint(equalTo: background_view.safeAreaLayoutGuide.trailingAnchor),
            current_view.bottomAnchor.constraint(equalTo: background_view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }


}

