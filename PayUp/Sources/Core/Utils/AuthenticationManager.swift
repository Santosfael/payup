//
//  AuthenticationManager.swift
//  PayUp
//
//  Created by Rafael on 04/01/26.
//

import LocalAuthentication
import UIKit

protocol AuthenticationManagerProtocol {
    func authenticateUser(completion: @escaping (Bool, String?) -> Void)
}

final class AuthenticationManager: AuthenticationManagerProtocol {

    static let shared = AuthenticationManager()

    func authenticateUser(completion: @escaping (Bool, String?) -> Void) {
        let context = LAContext()
        var error: NSError?
        
        if (context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)) {
            let reason = "Autentique-se para acessar seus dados seguros."
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        completion(true, nil)
                    } else {
                        let errorMessage = authenticationError?.localizedDescription ?? "Falha na autenticação."
                        completion(false, errorMessage)
                    }
                }
            }
        } else {
            let errorMessage = error?.localizedDescription ?? "O dispositivo não suporta auenticação biométrica ou ela não está configurada."
            
            completion(false, errorMessage)
        }
    }
}
