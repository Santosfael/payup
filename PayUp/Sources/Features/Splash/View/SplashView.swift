//
//  SplashView.swift
//  PayUp
//
//  Created by Rafael on 22/12/25.
//

import Foundation
import UIKit

final class SplashView: UIView {

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
}

extension SplashView: ViewCodeProtocol {
    func setupConstraints() {
        triangleImageView.frame = bounds
        logoImageView.center = center
        logoImageView.bounds.size = CGSize(width: 132, height: 39)
    }
    
    func setupAdditionalConfiguration() {
        addSubviews(
            triangleImageView,
            logoImageView
        )
    }
    
    func buildHierarchy() {
        backgroundColor = Colors.backgroundPrimary
    }
}
