//
//  ClientFormViewController.swift
//  PayUp
//
//  Created by Rafael on 29/12/25.
//

import UIKit

final class ClientFormViewController: UIViewController {
    
    // MARK: - Variables
    private let mode: ClientFormMode
    private let viewModel = DaySelectorViewModel()
    private let clientViewModel = ClientFormViewModel()
    private var hasInitializedPosition = false
    private lazy var clientFormView = ClientFormView(mode: mode)
    weak var delegate: CompanyListViewDelegate?
    

    // MARK: - Initializeds
    init(mode: ClientFormMode) {
        self.mode = mode
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .coverVertical
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func loadView() {
        view = clientFormView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        clientFormView.delegate = self
        clientFormView.daySelectorView.configure(days: viewModel.days,
                                                 selectedIndex: viewModel.selectedIndex)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard !hasInitializedPosition else { return }
        hasInitializedPosition = true
        clientFormView.containerView.transform = CGAffineTransform(translationX: 0, y: clientFormView.containerView.bounds.height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2) {
            self.clientFormView.containerView.transform = .identity
        }
    }
    
    // MARK: - Private Methods
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
}

// MARK: - Extension Custom Delegate ClientFormView
extension ClientFormViewController: ClientFormViewDelegate {
    func daySelected() -> Int? {
        return viewModel.getSelectedDay()
    }
    
    func didTapSave(client: Client?) {
        guard let client = client else {
            showAlert(title: "Erro", message: "Dados inseridos incorretamente, tente novamente")
            return
        }
        let success = clientViewModel.saveClient(client: client)
        
        if success {
            dismiss(animated: true)
            delegate?.didUpdateCompany()
        } else {
            showAlert(title: "Erro", message: "Não foi possível salvar os dados do cliente, tente novamente!")
        }
    }
    
    func didTapDelete() {
        let alert = UIAlertController(title: "Excluir cliente",
                                      message: "Tem certeza que deseja excluir este cliente",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        alert.addAction(UIAlertAction(title: "Excluir", style: .destructive) { _ in
            self.dismiss(animated: true)
        })
        
        present(alert, animated: true)
    }
    
    func didTapCancel() {
        dismiss(animated: true)
    }
}
