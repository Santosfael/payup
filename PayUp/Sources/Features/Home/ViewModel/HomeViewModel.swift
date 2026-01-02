//
//  HomeViewModel.swift
//  PayUp
//
//  Created by Rafael on 01/01/26.
//

import Foundation

final class HomeViewModel {
    private let databaseManager = DatabaseManager.shared
    
    internal func getAllClients() -> [Client] {
        return databaseManager.getAllClient()
    }

    internal func getTodayClients() -> [Client] {
        let allClients = getAllClients()
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        let todayString = dateFormatter.string(from: today)
        
        return allClients.filter { client in
            return client.dueDate == todayString
        }
    }

    internal func getCompanyModelsFormClients() -> [CompanyItemModel] {
        let clients = getAllClients()
        
        return clients.map { client in
            CompanyItemModel(name: client.name)
        }
    }

    internal func getTotalValueForToday() -> Double {
        let todayClients = getTodayClients()
        
        return todayClients.reduce(0) { total, client in
            return total + client.value
        }
    }
    
    internal func formatCurrency(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "BRL"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: value)) ?? "R$ 0,00"
    }

    internal func getClient(_ name: String) -> Client? {
        let allClients = getAllClients()
        return allClients.first { $0.name == name }
    }
}
