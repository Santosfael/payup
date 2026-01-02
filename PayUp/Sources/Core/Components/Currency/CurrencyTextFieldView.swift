//
//  CurrencyTextFieldView.swift
//  PayUp
//
//  Created by Rafael on 29/12/25.
//

import UIKit

final class CurrencyTextFieldView: UIView {

    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.textLabel
        label.font = Typography.labelMedium()
        return label
    }()
    
    private let currencyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("BRL ▼", for: .normal)
        button.titleLabel?.font = Typography.paragraphSmall()
        button.setTitleColor(Colors.textSpan, for: .normal)
        return button
    }()
    
    private lazy var valueTextField: PaddingTextField = {
        let textField = PaddingTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = Colors.backgroundSecondary
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.borderPrimary.cgColor
        textField.font = Typography.paragraphSmall()
        textField.textColor = Colors.textPlaceholder
        textField.keyboardType = .decimalPad
        textField.setLeftPaddingPoints(12)
        textField.rightViewMode = .always
        textField.rightView = self.currencyButton
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return textField
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel, valueTextField
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    // MARK: - Initializeds
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        valueTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: Colors.textPlaceholder])
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Method Manipulate TextField.text
    internal func getValue() -> Double {
        guard let text = valueTextField.text else { return 0.0 }
        let cleanText = text.replacingOccurrences(of: "R$", with: "")
            .replacingOccurrences(of: ",", with: ".")
            .replacingOccurrences(of: " ", with: "")
        
        return Double(cleanText) ?? 0.0
    }

    internal func setValue(_ value: Double) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "BRL"
        formatter.locale = Locale(identifier: "pt_BR")
        valueTextField.text = formatter.string(from: NSNumber(value: value)) ?? "R$ 0,00"
    }
}

// MARK: - Extension ViewCode
extension CurrencyTextFieldView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(stackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            valueTextField.heightAnchor.constraint(equalToConstant: 43),
        ])
    }
}
