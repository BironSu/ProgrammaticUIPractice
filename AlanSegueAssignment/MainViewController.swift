//
//  MainViewController.swift
//  AlanSegueAssignment
//
//  Created by Biron Su on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let mainView = MainView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(mainView)
        mainView.delegate = self
    }
}

extension MainViewController: MainViewDelegate {
    func mainSegue(message: String) {
        navigationController?.pushViewController(DetailViewController(message: message), animated: true)
    }
}
