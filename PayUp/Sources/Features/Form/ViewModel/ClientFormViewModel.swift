//
//  ClientFormViewModel.swift
//  PayUp
//
//  Created by Rafael on 01/01/26.
//

import Foundation

final class ClientFormViewModel {
    private let databaseManager = DatabaseManager.shared
    
    internal func saveClient(client: Client) -> Bool {
        return databaseManager.saveClient(client)
    }
    
    internal func getAllClients() -> [Client] {
        return databaseManager.getAllClient()
    }

    internal func getClientById(id: Int) -> Client? {
        return databaseManager.getClientById(by: id)
    }

    internal func deleteClientById(id: Int) -> Bool {
        return databaseManager.deleteClientById(by: id)
    }
}
