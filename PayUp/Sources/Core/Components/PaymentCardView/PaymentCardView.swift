//
//  PaymentCardView.swift
//  PayUp
//
//  Created by Rafael on 26/12/25.
//

import UIKit

final class PaymentCardView: UIView {

    // MARK: - UI Components
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.backgroundSecondary
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let iconImagemView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // label.text = "A receber"
        label.font = Typography.paragraphSmall()
        label.textColor = Colors.textSpan
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // label.text = "Aurora Tech Soluções Digitais"
        label.font = Typography.titleSmall()
        label.textColor = Colors.textHeading
        return label
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        // label.text = "R$ 250,00"
        label.font = Typography.paragraphMedium()
        label.textColor = Colors.textParagraph
        return label
    }()

    // MARK: - Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Internal method
    internal func configure(with model: PaymentCardModel) {
        let image = UIImage(named: model.type.iconName)
        
        iconImagemView.image = image
        titleLabel.text = model.type.title
        descriptionLabel.text = model.name
        costLabel.text = model.cost
    }
}

// MARK: - Extension ViewCode Protocol
extension PaymentCardView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubviews(container)
        container.addSubviews(iconImagemView,
                              titleLabel,
                              descriptionLabel,
                              costLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconImagemView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            iconImagemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconImagemView.widthAnchor.constraint(equalToConstant: 24),
            iconImagemView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: iconImagemView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImagemView.trailingAnchor, constant: 8),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            costLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 2),
            costLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            costLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
            
        ])
    }
    
    func setupAdditionalConfiguration() {
    }
}
