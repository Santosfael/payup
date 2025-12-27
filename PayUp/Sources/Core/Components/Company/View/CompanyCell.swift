//
//  CompanyCell.swift
//  PayUp
//
//  Created by Rafael on 26/12/25.
//

import UIKit

final class CompanyCell: UICollectionViewCell {

    // MARK: - Identifier
    static let identifier = "CompanyCell"
    
    // MARK: - UI Components
    private let iconBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.backgroundTertiary
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "company"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.textSpan
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Aurora Tech Soluções Digitais"
        label.font = Typography.titleSmall()
        label.textColor = Colors.textHeading
        label.numberOfLines = 0
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
    
    internal func configure (with model: CompanyItemModel) {
        nameLabel.text = model.name
    }
}

// MARK: - Extension ViewCode Protocol
extension CompanyCell: ViewCodeProtocol {
    func buildHierarchy() {
        addSubviews(iconBackgroundView, nameLabel)
        iconBackgroundView.addSubview(iconImageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            iconBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconBackgroundView.widthAnchor.constraint(equalToConstant: 31),
            iconBackgroundView.heightAnchor.constraint(equalToConstant: 31),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconBackgroundView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            nameLabel.topAnchor.constraint(equalTo: iconBackgroundView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: iconBackgroundView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = Colors.backgroundSecondary
        self.layer.cornerRadius = 6
    }
}
