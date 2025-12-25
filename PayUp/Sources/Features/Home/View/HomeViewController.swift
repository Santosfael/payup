//
//  HomeViewController.swift
//  PayUp
//
//  Created by Rafael on 25/12/25.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let viewModel = DaySelectorViewModel()
    private let homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupBindings()
    }
    
    private func setupBindings() {
        homeView.daySelectorView.configure(days: viewModel.days,
                                             selectedIndex: viewModel.selectedIndex)
    }
}

extension HomeViewController: DaySelectorViewDelegate {
    func daySelectorView(_ view: DaySelectorView, didSelectDayAt index: Int) {
        viewModel.selectDay(at: index)
    }
}
