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
    
    private let companies = [
        CompanyItemModel(name: "Aurora Tech soluções Digitais"),
        CompanyItemModel(name: "Veltrix Labs"),
        CompanyItemModel(name: "Orbitum Tech")
    ]
    
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
        homeView.companyListView.delegate = self
    }
}

extension HomeViewController: DaySelectorViewDelegate {
    func daySelectorView(_ view: DaySelectorView, didSelectDayAt index: Int) {
        viewModel.selectDay(at: index)
    }
}

extension HomeViewController: CompanyViewDelegate {
    func numberOfCompanies(in view: CompanyListView) -> Int {
        companies.count
    }
    
    func companyListView(_ view: CompanyListView, companyAt index: Int) -> CompanyItemModel {
        companies[index]
    }
    
    
}
