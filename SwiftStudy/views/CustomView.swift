//
//  CustomView.swift
//  SwiftStudy
//
//  Created by johnny on 7/11/19.
//  Copyright © 2019 orgname. All rights reserved.
//

import Foundation
import UIKit
//import SwiftStudy

class CustomView: UIView {
    lazy var addButton: UIButton = {
        let addButton = UIButton(type: .contactAdd)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    lazy var contentView: UIImageView = {
        let contentView = UIImageView()
        //contentView.image = UIImage(named: "WoodTexture")
        contentView.backgroundColor = .red
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        contentView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return contentView
    }()
    
    lazy var headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        headerTitle.text = "Custom View"
        headerTitle.textAlignment = .center
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        return headerTitle
    }()
    
    lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 0.5)
        headerView.layer.shadowColor = UIColor.gray.cgColor
        headerView.layer.shadowOffset = CGSize(width: 0, height: 10)
        headerView.layer.shadowOpacity = 1
        headerView.layer.shadowRadius = 5
        headerView.addSubview(headerTitle)
        headerView.addSubview(addButton)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
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
        addSubview(contentView)
        addSubview(headerView)
        setupLayout()
        setupActions()
    }
    
    private var headerViewTop: NSLayoutConstraint!
    
    private func setupLayout() {
        headerViewTop = headerView.topAnchor.constraint(equalTo: topAnchor)
        NSLayoutConstraint.activate([
            //pin headerTitle to headerView
            headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            //layout addButton in headerView
            addButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            
            //pin headerView to top
            headerViewTop,
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40),
            
            //layout contentView
            contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
    private func setupActions() {
        addButton.addTarget(self, action: #selector(moveHeaderView), for: .touchUpInside)
    }
    
    @objc private func moveHeaderView() {
        //here we have 2 ways to modify the constraint
        
        //first one (easier & preffered)
        //manual trigger layout cycle
        headerViewTop.constant += 10
        //setNeedsLayout()
        setNeedsUpdateConstraints()
        
        //second one (use for performance boost)
        //headerViewTopConstant += 10
    }
    
    //introduce a new variable for updateConstraints logic
//    private var headerViewTopConstant: CGFloat = 0 {
//        didSet {
//            //manual trigger layout cycle, but here
//            //we will set the constant inside updateConstraints
//            setNeedsUpdateConstraints()
//        }
//    }

//    override func updateConstraints() {
//        headerViewTop.constant = headerViewTopConstant
//        super.updateConstraints()
//    }
    
    //custom views should override this to return true if
    //they cannot layout correctly using autoresizing.
    //from apple docs https://developer.apple.com/documentation/uikit/uiview/1622549-requiresconstraintbasedlayout
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override var intrinsicContentSize: CGSize {
        //preferred content size, calculate it if some internal state changes
        return CGSize(width: 300, height: 300)
    }
}

let view = CustomView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
