//
//  UIView+Extensions.swift
//  PayUp
//
//  Created by Rafael on 22/12/25.
//

import Foundation
import UIKit

extension UIView {
    func animateMoveOut(to point: CGPoint, duration: TimeInterval) {
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut) {
            self.center = point
            self.alpha = 0
        }
    }
}
