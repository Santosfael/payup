//
//  ClientFormView.swift
//  PayUp
//
//  Created by Rafael on 29/12/25.
//

import UIKit

final class ClientFormView: UIView {
    
    // MARK: - ModeView and Delegate
    private let mode: ClientFormMode
    weak var delegate: ClientFormViewDelegate?
    
    // MARK: - UI Components
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.mode.title
        label.textColor = Colors.textHeading
        label.font = Typography.titleMedium()
        return label
    }()
    
    private let currencyTextFieldView: CurrencyTextFieldView = {
        let textField = CurrencyTextFieldView(title: "Valor", placeholder: "R$ 0,00")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let dateTextFieldView: DatePickerTextFieldView = {
        let textField = DatePickerTextFieldView(title: "Data de cobrança", placeholder: "DD/MM/AAAA")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var valueAndDataStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            currencyTextFieldView,
            dateTextFieldView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 12
        return stackView
    }()
    
    private let recurringLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recorrente"
        label.font = Typography.labelMedium()
        label.textColor = Colors.textLabel
        return label
    }()
    
    private lazy var formStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            valueAndDataStack
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 20, bottom: 20, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    // MARK: - Initializeds
    init(mode: ClientFormMode) {
        self.mode = mode
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension ViewCode
extension ClientFormView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(containerView)
        containerView.addSubview(formStack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            
            formStack.topAnchor.constraint(equalTo: containerView.topAnchor),
            formStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            formStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            formStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        backgroundColor = Colors.backgroundPrimary
    }
}
