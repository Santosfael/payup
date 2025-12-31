//
//  ClientFormMode.swift
//  PayUp
//
//  Created by Rafael on 29/12/25.
//

enum ClientFormMode {
    case add
    case edit
    
    var title: String {
        switch self {
        case .add:
            return "Adicionar cliente"
        case .edit:
            return "Editar cliente"
        }
    }
    
    var titleButton: String {
        switch self {
        case .add:
            return "Salvar"
        case .edit:
            return "Salvar alterações"
        }
    }
}
