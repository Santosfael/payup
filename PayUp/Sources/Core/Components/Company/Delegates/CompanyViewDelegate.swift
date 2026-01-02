//
//  CompanyListViewDelegate.swift
//  PayUp
//
//  Created by Rafael on 26/12/25.
//

import Foundation

protocol CompanyListViewDelegate: AnyObject {
    func numberOfCompanies(in view: CompanyListView) -> Int
    func companyListView(_ view: CompanyListView, companyAt index: Int) -> CompanyItemModel
    func didSelectCompany(_ company: CompanyItemModel)
    func didUpdateCompany()
}
