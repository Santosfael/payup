//
//  CompanyListView.swift
//  PayUp
//
//  Created by Rafael on 26/12/25.
//

import UIKit

final class CompanyListView: UIView {

    //private let viewModel: CompanyViewModel
    
    private var companies: [CompanyItemModel] = []
    weak var delegate: CompanyListViewDelegate?
    
    // MARK: - UI Components
    private let listAllCompanyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver todos", for: .normal)
        button.setTitleColor(Colors.accentBrand, for: .normal)
        button.titleLabel?.font = Typography.titleSmall()
        button.backgroundColor = .clear
        return button
    }()

    internal lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.dataSource = self
        colletionView.delegate = self
        colletionView.showsHorizontalScrollIndicator = false
        colletionView.backgroundColor = .clear
        colletionView.register(CompanyCell.self, forCellWithReuseIdentifier: CompanyCell.identifier)
        return colletionView
    }()

    // MARK: - Initializeds
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension ViewCode Protocol
extension CompanyListView: ViewCodeProtocol {

    func buildHierarchy() {
        addSubviews(listAllCompanyButton,
                    collectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            listAllCompanyButton.topAnchor.constraint(equalTo: topAnchor),
            listAllCompanyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: listAllCompanyButton.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }

    func setupAdditionalConfiguration() {
    }
}

// MARK: - Extension UICollectionView Data Source
extension CompanyListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.numberOfCompanies(in: self) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompanyCell.identifier, for: indexPath) as? CompanyCell else {
            return UICollectionViewCell()
        }
        
        if let company = delegate?.companyListView(self, companyAt: indexPath.row) {
            cell.configure(with: company)
        }
        
        return cell
    }
}

// MARK: - Extension UICollectioNView Delegates
extension CompanyListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 141)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCompany = delegate?.companyListView(self, companyAt: indexPath.item) else { return }
        delegate?.didSelectCompany(selectedCompany)
    }
}
