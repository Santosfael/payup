//
//  Typography.swift
//  PayUp
//
//  Created by Rafael on 22/12/25.
//

import Foundation
import UIKit

enum Typography {
    static func titleExtraLarge() -> UIFont? { UIFont(name: "K2D-Bold", size: 28) }
    static func titleLarge() -> UIFont? { UIFont(name: "K2D-Bold", size: 24) }
    static func titleMedium() -> UIFont? { UIFont(name: "K2D-Bold", size: 20) }
    static func titleSmall() -> UIFont? { UIFont(name: "K2D-Bold", size: 16) }
    
    static func paragraphLarge() -> UIFont? { UIFont(name: "K2D-Regular", size: 20)}
    static func paragraphMedium() -> UIFont? { UIFont(name: "K2D-Regular", size: 16)}
    static func paragraphSmall() -> UIFont? { UIFont(name: "K2D-Regular", size: 12)}
    
    static func labelMedium() -> UIFont? {UIFont(name: "K2D-SemiBold", size: 16)}
    
    static func headline() -> UIFont? { UIFont(name: "K2D-Bold", size: 12)}
    
}
