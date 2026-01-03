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
    private let homeViewModel = HomeViewModel()
    
    private let companies = [
        CompanyItemModel(name: "Aurora Tech soluções Digitais"),
        CompanyItemModel(name: "Veltrix Labs"),
        CompanyItemModel(name: "Orbitum Tech")
    ]
    
    // MARK: - Life Cycle
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupBindings()
        setupCompanyListDelegate()
        setNotificationObserver()
    }

    // MARK: - Private Methods
    private func setupBindings() {
        homeView.daySelectorView.configure(days: viewModel.days,
                                             selectedIndex: viewModel.selectedIndex)
        homeView.companyListView.delegate = self
        homeView.onTapAddClient = { [weak self] in
            guard self != nil else { return }
            let formViewController = ClientFormViewController(mode: .add)
            formViewController.modalTransitionStyle = .coverVertical
            formViewController.modalPresentationStyle = .overFullScreen
            self?.present(formViewController, animated: true)
        }
    }

    private func setupCompanyListDelegate() {
        homeView.setCompanyListDelegate(self)
    }

    private func setNotificationObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleClientDataChanged),
                                               name: .clientDataChanged,
                                               object: nil)
    }

    @objc private func handleClientDataChanged() {
        homeView.companyListView.collectionView.reloadData()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Extension Custom Delegate DaySelector
extension HomeViewController: DaySelectorViewDelegate {
    func selectedDay() -> Int? {
        return viewModel.getSelectedDay()
    }
    
    func daySelectorView(_ view: DaySelectorView, didSelectDayAt index: Int) {
        viewModel.selectDay(at: index)
    }
}

extension HomeViewController: CompanyListViewDelegate {

    func didSelectCompany(_ company: CompanyItemModel) {
        guard let client =  homeViewModel.getClient(company.name) else { return }
        
        let formViewController = ClientFormViewController(mode: .edit(client))
        formViewController.modalTransitionStyle = .coverVertical
        formViewController.modalPresentationStyle = .overFullScreen
        self.present(formViewController, animated: true)
    }

    func numberOfCompanies(in view: CompanyListView) -> Int {
        homeViewModel.getCompanyModelsFormClients().count
    }
    
    func companyListView(_ view: CompanyListView, companyAt index: Int) -> CompanyItemModel {
        let clients = homeViewModel.getCompanyModelsFormClients()
        return clients[index]
    }
    
    
}
