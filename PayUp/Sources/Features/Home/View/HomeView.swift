//
//  HomeView.swift
//  PayUp
//
//  Created by Rafael on 25/12/25.
//

import UIKit

class HomeView: UIView {
    
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
                    profileImageView)
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
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.backgroundPrimary
    }
}
