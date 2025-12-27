//
//  PaymentCardType.swift
//  PayUp
//
//  Created by Rafael on 27/12/25.
//

import Foundation

enum PaymentCardType {
    case incoming
    case transaction
    case noPayments
    
    var iconName: String {
        switch self {
        case .incoming:
            return "calendarDollar"
        case .transaction:
            return "coins"
        case .noPayments:
            return "calendar"
        }
    }
    
    var title: String {
        switch self {
        case .incoming:
            return "A receber"
        case .transaction:
            return "Recebido"
        case .noPayments:
            return ""
        }
    }
}
