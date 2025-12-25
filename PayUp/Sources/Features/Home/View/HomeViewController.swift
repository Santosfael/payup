//
//  HomeViewController.swift
//  PayUp
//
//  Created by Rafael on 25/12/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }

}
