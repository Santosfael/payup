//
//  Typography.swift
//  PayUp
//
//  Created by Rafael on 22/12/25.
//

import Foundation
import UIKit

enum Typography {
    static func titleExtraLarge() -> UIFont { UIFont(name: "K2D-Bold", size: 28) ?? UIFont() }
    static func titleLarge() -> UIFont { UIFont(name: "K2D-Bold", size: 24) ?? UIFont() }
    static func titleMedium() -> UIFont { UIFont(name: "K2D-Bold", size: 20) ?? UIFont() }
    static func titleSmall() -> UIFont { UIFont(name: "K2D-Bold", size: 16) ?? UIFont() }
    
    static func paragraphLarge() -> UIFont { UIFont(name: "K2D-Regular", size: 20) ?? UIFont() }
    static func paragraphMedium() -> UIFont { UIFont(name: "K2D-Regular", size: 16) ?? UIFont() }
    static func paragraphSmall() -> UIFont { UIFont(name: "K2D-Regular", size: 12) ?? UIFont() }
    
    static func labelMedium() -> UIFont { UIFont(name: "K2D-SemiBold", size: 16) ?? UIFont() }
    
    static func headline() -> UIFont { UIFont(name: "K2D-Bold", size: 12) ?? UIFont() }
    
}
