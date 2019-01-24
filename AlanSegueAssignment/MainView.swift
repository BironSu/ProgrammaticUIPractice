//
//  MainView.swift
//  AlanSegueAssignment
//
//  Created by Biron Su on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func mainSegue(message: String)
}
class MainView: UIView {

    weak var delegate: MainViewDelegate?
    
    var textMessage = "Enter A Message..."
    lazy var segueButton: UIButton = {
        let button = UIButton()
        button.setTitle("SEGUE TIME", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(seguePressed), for: .touchUpInside)
        return button
    }()
    lazy var textField: UITextField = {
        let text = UITextField()
        text.text = textMessage
        text.textColor = .black
        text.backgroundColor = .lightGray
        text.textAlignment = .center
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 2
        text.delegate = self
        return text
    }()
    @objc func seguePressed(){
        delegate?.mainSegue(message: textMessage)
    }
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        segueButton.isEnabled = false
        segueButton.isHidden = true
        addSubview(segueButton)
        addSubview(textField)
        setConstraints()
    }
    func setConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        segueButton.translatesAutoresizingMaskIntoConstraints = false
        segueButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor, constant: 50).isActive = true
        segueButton.centerXAnchor.constraint(equalTo: textField.centerXAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
}
extension MainView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == textMessage {
            textField.text = ""
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let message = textField.text {
            textMessage = message
            segueButton.isHidden = false
            segueButton.isEnabled = true
        }
        resignFirstResponder()
        return true
    }
}
