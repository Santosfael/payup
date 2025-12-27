//
//  CompanyViewModel.swift
//  PayUp
//
//  Created by Rafael on 26/12/25.
//

import Foundation

final class CompanyViewModel {
    var companies: [CompanyItemModel] = []
    
    init(companies: [CompanyItemModel]) {
        self.companies = companies
    }
}
