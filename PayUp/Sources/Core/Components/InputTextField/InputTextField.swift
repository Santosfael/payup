//
//  InputTextField.swift
//  PayUp
//
//  Created by Rafael on 22/12/25.
//

import Foundation
import UIKit

final class InputTextField: UIView {
    
    // MARK: UIComponents
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.titleSmall()
        label.textColor = Colors.textHeading
        return label
    }()
    
    private let textfield: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = Colors.backgroundTertiary
        textField.textColor = Colors.textLabel
        textField.font = Typography.paragraphMedium()
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.borderPrimary.cgColor
        textField.setLeftPaddingPoints(12)
        return textField
    }()
    
    private let type: InputTextFieldType
    
    // MARK: Initializeds
    init(title: String,
         placeholder: String,
         type: InputTextFieldType = .normal,
         autoCaptalized: UITextAutocapitalizationType = .words) {
        self.type = type
        super.init(frame: .zero)
        setupView()
        setupTextFieldPlaceholder(placeholder: placeholder)
        self.titleLabel.text = title
        textfield.autocapitalizationType = autoCaptalized
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextFieldPlaceholder(placeholder: String) {
        textfield.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: Colors.textPlaceholder,
                //.font: Typography.paragraphSmall()
            ]
        )
        textfield.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    // MARK: Private Objc Methods
    @objc private func textDidChange() {
        switch type {
        case .normal:
            break
        case .cellphone:
            maskPhoneNumber()
        case .cnpj:
            maskCNPJ()
        }
    }
    
    // MARK: Private Methods
    private func applyMask(mask: String, to value: String) -> String {
        var result = ""
        var index = value.startIndex
        
        for ch in mask where index < value.endIndex {
            if (ch == "#") {
                result.append(value[index])
                index = value.index(after: index)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }

    private func maskPhoneNumber() {
        guard let text = textfield.text else {
            return
        }
        
        let cleanPhoneNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "(##) #####-####"
        textfield.text = applyMask(mask: mask, to: cleanPhoneNumber)
    }

    private func maskCNPJ() {
        guard let text = textfield.text else {
            return
        }
        
        let cleanCNPJ = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "##.###.###/####-##"
        textfield.text = applyMask(mask: mask, to: cleanCNPJ)
    }

    // MARK: - Internal Method Manipulate TextField.text
    internal func getText() -> String? {
        return textfield.text
    }
    
    internal func setText(_ v: String) {
        textfield.text = v
    }
}

// MARK: ViewCode Protocol Extends
extension InputTextField: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubviews(titleLabel, textfield)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textfield.heightAnchor.constraint(equalToConstant: 39),
            textfield.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            textfield.leadingAnchor.constraint(equalTo: leadingAnchor),
            textfield.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
}
