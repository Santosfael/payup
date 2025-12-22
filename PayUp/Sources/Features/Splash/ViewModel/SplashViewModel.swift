//
//  SplashViewModel.swift
//  PayUp
//
//  Created by Rafael on 22/12/25.
//

import Foundation

final class SplashViewModel {
    var onAnimationCompleted: (() -> Void)?
    
    func performInitialanimation(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion()
        }
    }
}
