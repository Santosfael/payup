//
//  HomeView.swift
//  PayUp
//
//  Created by Rafael on 25/12/25.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hoje"
        label.font = Typography.titleSmall()
        label.textColor = Colors.textHeading
        return label
    }()
    
    private let addClientsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar Cliente", for: .normal)
        button.setTitleColor(Colors.textInvert, for: .normal)
        button.titleLabel?.font = Typography.labelMedium()
        button.backgroundColor = Colors.accentBrand
        button.layer.cornerRadius = 6
        return button
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
    
    private let transactionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "lançamentos"
        label.font = Typography.titleMedium()
        label.textColor = Colors.textHeading
        return label
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Filtrar", for: .normal)
        button.setTitleColor(Colors.textHeading, for: .normal)
        button.titleLabel?.font = Typography.labelMedium()
        button.backgroundColor = Colors.backgroundSecondary
        button.layer.cornerRadius = 6
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -4)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        return button
    }()
    
    private let transactionDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "01 de abril"
        label.font = Typography.paragraphMedium()
        label.textColor = Colors.textHeading
        return label
    }()
    
    private let transactionCardView: PaymentCardView = {
        let cardView = PaymentCardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()

    // MARK: - Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPaymentCard() {
        let transactionModel = PaymentCardModel(type: .incoming, name: "Aurora Tech Soluções Digitais", cost: "R$ 250,00")
        paymentCardView.configure(with: transactionModel)
    }
    
    private func setupTransactionCard() {
        let transactionModel = PaymentCardModel(type: .transaction, name: "Duna Sport", cost: "R$ 450,00")
        transactionCardView.configure(with: transactionModel)
    }
}

// MARK: - Extension ViewCode Protocol
extension HomeView: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(logoImageView,
                                bellButton,
                                profileImageView,
                                daySelectorView,
                                todayLabel,
                                paymentCardView,
                                addClientsButton,
                                companyListView,
                                transactionLabel,
                                filterButton,
                                transactionDateLabel,
                                transactionCardView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 82),
            logoImageView.heightAnchor.constraint(equalToConstant: 24),
            
            bellButton.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            bellButton.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: -24),
            bellButton.widthAnchor.constraint(equalToConstant: 24),
            bellButton.heightAnchor.constraint(equalToConstant: 24),
            
            profileImageView.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            profileImageView.widthAnchor.constraint(equalToConstant: 44),
            profileImageView.heightAnchor.constraint(equalToConstant: 44),
            
            daySelectorView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 55),
            daySelectorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            daySelectorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            daySelectorView.heightAnchor.constraint(equalToConstant: 32),
            
            todayLabel.topAnchor.constraint(equalTo: daySelectorView.bottomAnchor, constant: 20),
            todayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            todayLabel.heightAnchor.constraint(equalToConstant: 22),
            
            paymentCardView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 20),
            paymentCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            paymentCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            paymentCardView.heightAnchor.constraint(equalToConstant: 90),
            
            addClientsButton.topAnchor.constraint(equalTo: paymentCardView.bottomAnchor, constant: 48),
            addClientsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            addClientsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            addClientsButton.heightAnchor.constraint(equalToConstant: 40),
            
            companyListView.topAnchor.constraint(equalTo: addClientsButton.bottomAnchor, constant: 48),
            companyListView.leadingAnchor.constraint(equalTo: paymentCardView.leadingAnchor),
            companyListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            companyListView.heightAnchor.constraint(equalToConstant: 200),
            
            transactionLabel.topAnchor.constraint(equalTo: companyListView.bottomAnchor, constant: 48),
            transactionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            filterButton.topAnchor.constraint(equalTo: transactionLabel.topAnchor),
            filterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            filterButton.heightAnchor.constraint(equalToConstant: 40),
            
            transactionDateLabel.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 23),
            transactionDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            transactionCardView.topAnchor.constraint(equalTo: transactionDateLabel.bottomAnchor, constant: 8),
            transactionCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            transactionCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            transactionCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            transactionCardView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.backgroundPrimary
        setupPaymentCard()
        setupTransactionCard()
    }
}
