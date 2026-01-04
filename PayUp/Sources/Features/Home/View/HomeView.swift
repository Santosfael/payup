//
//  HomeView.swift
//  PayUp
//
//  Created by Rafael on 25/12/25.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - Delegate
    weak var delegate: HomeViewDelegate?
    
    // MARK: - UI Components
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        return view
    }()
    
    private lazy var headerStack: UIStackView = {
        let space = UIView()
        let stack = UIStackView(arrangedSubviews:  [
            logoImageView, space, bellButton, profileImageView
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.setCustomSpacing(24, after: bellButton)
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    private let logoImageView: UIImageView  = {
        let imageView = UIImageView(image: UIImage(named: "mainLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 82),
            imageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        return imageView
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = Colors.textHeading
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 24),
            button.heightAnchor.constraint(equalToConstant: 24)
        ])
        return button
    }()
    
    private let profileImageView: UIImageView  = {
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 44),
            imageView.heightAnchor.constraint(equalToConstant: 44)
        ])
        return imageView
    }()
    
    let daySelectorView: DaySelectorView = {
        let daySelectorView = DaySelectorView()
        daySelectorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            daySelectorView.heightAnchor.constraint(equalToConstant: 32)
        ])
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
    
    private lazy var todayStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            todayLabel, paymentCardView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let paymentCardView: PaymentCardView = {
        let paymentCardView = PaymentCardView()
        paymentCardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paymentCardView.heightAnchor.constraint(equalToConstant: 90)
        ])
        return paymentCardView
    }()
    
    private lazy var addClientsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar Cliente", for: .normal)
        button.setTitleColor(Colors.textInvert, for: .normal)
        button.titleLabel?.font = Typography.labelMedium()
        button.backgroundColor = Colors.accentBrand
        button.layer.cornerRadius = 6
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        button.addTarget(self, action: #selector(didTapAddClient), for: .touchUpInside)
        return button
    }()
    
    lazy var companyListView: CompanyListView = {
        let companyView = CompanyListView()
        companyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            companyView.heightAnchor.constraint(equalToConstant: 200)
        ])
        return companyView
    }()
    
    private let transactionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lançamentos"
        label.font = Typography.titleMedium()
        label.textColor = Colors.textHeading
        return label
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(Colors.textHeading, for: .normal)
        button.setTitle("Filtrar", for: .normal)
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.titleLabel?.font = Typography.labelMedium()
        button.backgroundColor = Colors.backgroundSecondary
        button.tintColor = Colors.textHeading
        button.layer.cornerRadius = 6
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -4)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        return button
    }()
    
    private lazy var transactionHeaderStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            transactionLabel, UIView(), filterButton
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
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
        NSLayoutConstraint.activate([
            cardView.heightAnchor.constraint(equalToConstant: 90)
        ])
        return cardView
    }()
    
    private lazy var transactionsStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            transactionDateLabel,
            transactionCardView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            headerStack,
            daySelectorView,
            todayStack,
            addClientsButton,
            companyListView,
            transactionHeaderStack,
            transactionsStack
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 48
        return stackView
    }()

    // MARK: - Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    private func setupPaymentCard() {
        let transactionModel = PaymentCardModel(type: .incoming, name: "Aurora Tech Soluções Digitais", cost: "R$ 250,00")
        paymentCardView.configure(with: transactionModel)
    }
    
    private func setupTransactionCard() {
        let transactionModel = PaymentCardModel(type: .transaction, name: "Duna Sport", cost: "R$ 450,00")
        transactionCardView.configure(with: transactionModel)
    }

    @objc private func didTapAddClient() {
        delegate?.didTapAddNewClient()
    }

    internal func setCompanyListDelegate(_ delegate: CompanyListViewDelegate) {
        companyListView.delegate = delegate
    }

    internal func reloadCompanyList() {
        companyListView.collectionView.reloadData()
    }
}

// MARK: - Extension ViewCode Protocol
extension HomeView: ViewCodeProtocol {
    
    func buildHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            mainStack.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.backgroundPrimary
        setupPaymentCard()
        setupTransactionCard()
    }
}
