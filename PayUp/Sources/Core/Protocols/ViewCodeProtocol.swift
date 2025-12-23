//
//  ViewCodeProtocol.swift
//  PayUp
//
//  Created by Rafael on 22/12/25.
//

import Foundation

protocol ViewCodeProtocol {
    func buildHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCodeProtocol {
    func setupView()  {
        buildHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func buildHierarchy() {}

    func setupConstraints() {}

    func setupAdditionalConfiguration() {}
}
