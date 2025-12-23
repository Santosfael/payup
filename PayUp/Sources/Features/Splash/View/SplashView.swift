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
    
    let exemple = InputTextField(title: "CNPJ", placeholder: "CNPJ", type: .cellphone)
    
    // MARK: Initializeds
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
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
        
        exemple.frame = CGRect(x: 32, y: bounds.height - 200, width: bounds.width - 70, height: 60)
    }
    
    func setupAdditionalConfiguration() {
        addSubviews(
            triangleImageView,
            logoImageView,
            exemple
        )
    }
    
    func buildHierarchy() {
        backgroundColor = Colors.backgroundPrimary
    }
}
