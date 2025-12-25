//
//  SplashView.swift
//  PayUp
//
//  Created by Rafael on 22/12/25.
//

import Foundation
import UIKit

final class SplashView: UIView {

    // MARK: UI Components
    let triangleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "animatedSplashTriangle"))
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0
        return imageView
    }()

    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "mainLogo"))
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        return imageView
    }()
    
    let exemple = AuthenticationView()
    
    // MARK: Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrider Methods UI
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
}

// MARK: ViewCode Protocol Extends
extension SplashView: ViewCodeProtocol {
    func setupConstraints() {
        triangleImageView.frame = bounds
        logoImageView.center = center
        logoImageView.bounds.size = CGSize(width: 132, height: 39)
        
        exemple.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            exemple.centerXAnchor.constraint(equalTo: centerXAnchor),
            exemple.centerYAnchor.constraint(equalTo: centerYAnchor),
            exemple.widthAnchor.constraint(equalToConstant: 343),
            exemple.heightAnchor.constraint(equalToConstant: 606)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.backgroundPrimary
    }
    
    func buildHierarchy() {
        addSubviews(
            triangleImageView,
            logoImageView,
            exemple
        )
    }
}
