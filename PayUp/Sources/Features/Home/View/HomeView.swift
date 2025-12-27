//
//  HomeView.swift
//  PayUp
//
//  Created by Rafael on 25/12/25.
//

import UIKit

final class HomeView: UIView {
    
    let mockCompanies = [
        CompanyItemModel(name: "Aurora Tech soluções Digitais"),
        CompanyItemModel(name: "Veltrix Labs"),
        CompanyItemModel(name: "Orbitum Tech")
    ]
    
    // MARK: - UI Components
    private let logoImageView: UIImageView  = {
        let imageView = UIImageView(image: UIImage(named: "mainLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = Colors.textHeading
        return button
    }()
    
    private let profileImageView: UIImageView  = {
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    let daySelectorView: DaySelectorView = {
        let daySelectorView = DaySelectorView()
        daySelectorView.translatesAutoresizingMaskIntoConstraints = false
        return daySelectorView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hoje"
        label.font = Typography.titleSmall()
        label.textColor = Colors.textHeading
        return label
    }()
    
    private let paymentCardView: PaymentCardView = {
        let paymentCardView = PaymentCardView()
        paymentCardView.translatesAutoresizingMaskIntoConstraints = false
        return paymentCardView
    }()
    
    lazy var companyListView: CompanyListView = {
        let companyView = CompanyListView()
        companyView.translatesAutoresizingMaskIntoConstraints = false
        return companyView
    }()

    // MARK: - Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension ViewCode Protocol
extension HomeView: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubviews(logoImageView,
                    bellButton,
                    profileImageView,
                    daySelectorView,
                    titleLabel,
                    paymentCardView,
                    companyListView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 82),
            logoImageView.heightAnchor.constraint(equalToConstant: 24),
            
            bellButton.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            bellButton.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: -24),
            bellButton.widthAnchor.constraint(equalToConstant: 24),
            bellButton.heightAnchor.constraint(equalToConstant: 24),
            
            profileImageView.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            profileImageView.widthAnchor.constraint(equalToConstant: 44),
            profileImageView.heightAnchor.constraint(equalToConstant: 44),
            
            daySelectorView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 55),
            daySelectorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            daySelectorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            daySelectorView.heightAnchor.constraint(equalToConstant: 32),
            
            titleLabel.topAnchor.constraint(equalTo: daySelectorView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            paymentCardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            paymentCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            paymentCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            companyListView.topAnchor.constraint(equalTo: paymentCardView.bottomAnchor, constant: 48),
            companyListView.leadingAnchor.constraint(equalTo: paymentCardView.leadingAnchor),
            companyListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            companyListView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.backgroundPrimary
    }
}
