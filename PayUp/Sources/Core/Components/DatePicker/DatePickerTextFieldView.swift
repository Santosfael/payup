//
//  DatePickerTextFieldView.swift
//  PayUp
//
//  Created by Rafael on 29/12/25.
//

import UIKit

final class DatePickerTextFieldView: UIView {

    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.textLabel
        label.font = Typography.labelMedium()
        return label
    }()
    
    private lazy var calendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "calendar"), for: .normal)
        button.tintColor = Colors.textPlaceholder
        button.addTarget(self, action: #selector(presentDatePicker), for: .touchUpInside)
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
        textField.setLeftPaddingPoints(12)
        textField.rightViewMode = .always
        textField.rightView = self.calendarButton
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
    
    @objc private func presentDatePicker() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        alert.view.addSubview(picker)
        
        NSLayoutConstraint.activate([
            picker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor, constant: 8),
            picker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor, constant: -8),
            picker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 8),
            picker.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        alert.addAction(.init(title: "Ok", style: .default) { _ in
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "dd/MM/yyyy"
            self.valueTextField.text = dateFormater.string(from: picker.date)
        })
        alert.addAction(.init(title: "Cancelar", style: .cancel))
        
        if let viewController = self.parentViewController() {
            viewController.present(alert, animated: true)
        }
    }
    
    // MARK: - Internal Method Manipulate TextField.text
    internal func getText() -> String? {
        return valueTextField.text
    }
    
    internal func setText(_ v: String) {
        valueTextField.text = v
    }
}

// MARK: - Extension ViewCode
extension DatePickerTextFieldView: ViewCodeProtocol {
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
