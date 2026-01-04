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
    
    private let recurringSwitch: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = Colors.accentBrand
        switchView.backgroundColor = Colors.backgroundComponent
        switchView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        switchView.layer.cornerRadius = 13
        return switchView
    }()
    
    private let frequencyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Mensalmente", for: .normal)
        button.setTitleColor(Colors.textLabel, for: .normal)
        button.titleLabel?.font = Typography.labelMedium()
        button.backgroundColor = Colors.backgroundComponent
        //button.contentHorizontalAlignment = .leading
        button.layer.cornerRadius = 13
        button.widthAnchor.constraint(equalToConstant: 122).isActive = true
        button.heightAnchor.constraint(equalToConstant: 26).isActive = true
        return button
    }()
    
    private lazy var recurringStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            recurringLabel,
            recurringSwitch,
            frequencyButton
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let daySelectorView: DaySelectorView = {
        let daySelectorView = DaySelectorView()
        daySelectorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            daySelectorView.heightAnchor.constraint(equalToConstant: 32)
        ])
        return daySelectorView
    }()
    
    private lazy var clientNameField = InputTextField(title: "Nome do cliente", placeholder: "Ex: João Silva | Loja do Bairro", type: .normal)
    
    private lazy var contactField = InputTextField(title: "Contato", placeholder: "Ex: joao@email.com", type: .normal, autoCaptalized: .none)
    
    private lazy var phoneField = InputTextField(title: "Telefone", placeholder: "Ex: (11) 91234-5678", type: .cellphone)

    private lazy var cnpjField = InputTextField(title: "CNPJ", placeholder: "Ex: 12.2345.678/0001-90", type: .cnpj)

    private lazy var addressField = InputTextField(title: "Endereço", placeholder: "Ex: Rua das Flores, 123 – Centro, São Paulo – SP", type: .normal)
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(Colors.textHeading, for: .normal)
        button.titleLabel?.font = Typography.labelMedium()
        button.backgroundColor = Colors.backgroundSecondary
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(self.mode.titleButton, for: .normal)
        button.setTitleColor(Colors.textInvert, for: .normal)
        button.titleLabel?.font = Typography.labelMedium()
        button.backgroundColor = Colors.accentBrand
        button.layer.cornerRadius = 6
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 152).isActive = true
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = Colors.accentRed
        button.backgroundColor = .clear
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        switch mode {
        case .add:
            stackView.addArrangedSubview(cancelButton)
            stackView.addArrangedSubview(saveButton)
        case .edit(_):
            stackView.addArrangedSubview(deleteButton)
            stackView.addArrangedSubview(cancelButton)
            stackView.addArrangedSubview(saveButton)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 12
        return stackView
    }()

    private let recurringContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.backgroundPrimary
        view.layer.cornerRadius = 8
        return view
    }()

    private lazy var formStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            valueAndDataStack,
            recurringContainerView,
            daySelectorView,
            clientNameField,
            contactField,
            phoneField,
            cnpjField,
            addressField,
            buttonsStackView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    private let frequencyOptions = [
        "Mensalmente",
        "Semanalmente",
        "Anualmente"
    ]
    
    private var selectedFrequency = "Mensalmente"
    
    // MARK: - Initializeds
    init(mode: ClientFormMode) {
        self.mode = mode
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupActions() {
        recurringSwitch.addTarget(self, action: #selector(recurringToggled), for: .valueChanged)
        frequencyButton.addTarget(self, action: #selector(frequencyTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    private func setupInitialState() {
        daySelectorView.isHidden = !recurringSwitch.isOn
        frequencyButton.isHidden = !recurringSwitch.isOn
        
        switch mode {
        case .add:
            break
        case .edit(let client):
            populateFieldsForEditMode(client: client)
        }
    }

    private func getClientData() -> Client? {
        guard let name = clientNameField.getText(), !name.isEmpty,
              let contact = contactField.getText(), !contact.isEmpty,
              let phone = phoneField.getText(), !phone.isEmpty,
              let cnpj = cnpjField.getText(), !cnpj.isEmpty,
              let address = addressField.getText(), !cnpj.isEmpty,
              let dueDate = dateTextFieldView.getText(), !dueDate.isEmpty else { return nil }

        let currency = currencyTextFieldView.getValue()
        let selectedDay = delegate?.daySelected()
        
        var clientId: Int?
        
        switch mode {
        case .add:
            clientId = nil
        case .edit(let client):
            clientId = client.id
        }
        
        return Client(id: clientId,
                      name: name,
                      contact: contact,
                      phone: phone,
                      cnpj: cnpj,
                      address: address,
                      value: currency,
                      dueDate: dueDate,
                      isRecurring: recurringSwitch.isOn,
                      frequency: selectedFrequency,
                      selectedDay: selectedDay)
    }
    
    private func populateFieldsForEditMode(client: Client) {
        clientNameField.setText(client.name)
        contactField.setText(client.contact)
        phoneField.setText(client.phone)
        cnpjField.setText(client.cnpj)
        addressField.setText(client.address)
        currencyTextFieldView.setValue(client.value)
        dateTextFieldView.setText(client.dueDate)
        recurringSwitch.isOn = client.isRecurring
        selectedFrequency = client.frequency
        frequencyButton.setTitle(client.frequency, for: .normal)
        
        if let selectedDay = client.selectedDay {
            daySelectorView.setSelectedDay(selectedDay)
        }
        
        daySelectorView.isHidden = !recurringSwitch.isOn
        frequencyButton.isHidden = !recurringSwitch.isOn
        
    }
    
    // MARK: - Objc private Methods
    @objc private func recurringToggled() {
        daySelectorView.isHidden = !recurringSwitch.isOn
        frequencyButton.isHidden = !recurringSwitch.isOn
    }
    
    @objc private func frequencyTapped() {
        let alert = UIAlertController(title: "Frequencia", message: "Selecione a frequencia de cobrança", preferredStyle: .actionSheet)
        
        for option in frequencyOptions {
            let action = UIAlertAction(title: option, style: .default) { [weak self] _ in
                guard let self = self else { return }
                self.selectedFrequency = option
                self.frequencyButton.setTitle(option, for: .normal)
            }
            
            alert.addAction(action)
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        
        if let viewController = self.parentViewController() {
            viewController.present(alert, animated: true)
        }
    }

    @objc private func cancelTapped() {
        delegate?.didTapCancel()
    }
    
    @objc private func saveTapped() {
        if (dateTextFieldView.validateCurrentDate() == true) {
            delegate?.didTapSave(client: getClientData())
        } else {
            print("Data inválida")
            //delegate?.didTapSave()
        }
    }
    
    @objc private func deleteTapped() {
        delegate?.didTapDelete()
    }
}

// MARK: - Extension ViewCode
extension ClientFormView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(containerView)
        recurringContainerView.addSubview(recurringStackView)
        scrollView.addSubview(formStack)
        containerView.addSubview(scrollView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            
            formStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            formStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            formStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            formStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            formStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            recurringStackView.topAnchor.constraint(equalTo: recurringContainerView.topAnchor),
            recurringStackView.leadingAnchor.constraint(equalTo: recurringContainerView.leadingAnchor),
            recurringStackView.trailingAnchor.constraint(equalTo: recurringContainerView.trailingAnchor),
            recurringStackView.bottomAnchor.constraint(equalTo: recurringContainerView.bottomAnchor)
        ])
        
        switch mode {
        case .add:
            break
        case .edit(_):
            NSLayoutConstraint.activate([
                deleteButton.widthAnchor.constraint(equalToConstant: 40),
                deleteButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
    }

    func setupAdditionalConfiguration() {
        backgroundColor = Colors.backgroundPrimary
        setupActions()
        setupInitialState()
    }
}
