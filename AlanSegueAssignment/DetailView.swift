//
//  DetailView.swift
//  AlanSegueAssignment
//
//  Created by Biron Su on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Testing"
        label.textAlignment = .center
        label.layer.borderWidth = 1
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(label)
        backgroundColor = .white
        setConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
}
