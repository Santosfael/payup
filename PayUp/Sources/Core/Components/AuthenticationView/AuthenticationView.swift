//
//  AuthenticationView.swift
//  PayUp
//
//  Created by Rafael on 23/12/25.
//

import UIKit

final class AuthenticationView: UIView {

    // MARK: UI Components
    private let backgroundView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "backgroundView"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "mainLogo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.titleLarge()
        label.textColor = Colors.textHeading
        label.text = "Olá Calisto,"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.paragraphMedium()
        label.textColor = Colors.textParagraph
        label.text = "Desbloqueie com segurança usando oo Face ID."
        label.numberOfLines = 0
        return label
    }()
    
    private let faceIdIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "faceId"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let ellispe1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ellipse1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let ellispe2: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ellipse2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let ellispe3: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ellipse3"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func animateEllipse() {
        let ellipses = [ellispe3, ellispe2, ellispe1]
        for (index, ellipse) in ellipses.enumerated() {
            ellipse.alpha = 0
            UIView.animate(withDuration: 1.0, delay: Double(index) * 0.4, options: [.repeat, .autoreverse]) {
                ellipse.alpha = 0.15
            }
        }
    }
}

// MARK: Extension View Code Protocol
extension AuthenticationView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubviews(backgroundView,
                    logoImageView,
                    titleLabel,
                    descriptionLabel,
                    faceIdIcon,
                    ellispe1,
                    ellispe2,
                    ellispe3)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 94),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            faceIdIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            faceIdIcon.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 65),
            faceIdIcon.widthAnchor.constraint(equalToConstant: 40),
            faceIdIcon.heightAnchor.constraint(equalToConstant: 40),
            
            ellispe1.centerXAnchor.constraint(equalTo: faceIdIcon.centerXAnchor),
            ellispe1.centerYAnchor.constraint(equalTo: faceIdIcon.centerYAnchor),
            
            ellispe2.centerXAnchor.constraint(equalTo: faceIdIcon.centerXAnchor),
            ellispe2.centerYAnchor.constraint(equalTo: faceIdIcon.centerYAnchor),
            
            ellispe3.centerXAnchor.constraint(equalTo: faceIdIcon.centerXAnchor),
            ellispe3.centerYAnchor.constraint(equalTo: faceIdIcon.centerYAnchor),
        ])
    }
    
    func setupAdditionalConfiguration() {
        animateEllipse()
    }
}
