//
//  PaddingTextField.swift
//  PayUp
//
//  Created by Rafael on 29/12/25.
//

import UIKit

final class PaddingTextField: UITextField {

    private let rightPadding: CGFloat = 12

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        
        // Move o rightView para a esquerda, criando espaço da borda direita
        rect.origin.x -= rightPadding
        
        return rect
    }
}
