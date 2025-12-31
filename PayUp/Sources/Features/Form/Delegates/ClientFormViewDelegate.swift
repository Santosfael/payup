//
//  ClientFormViewDelegate.swift
//  PayUp
//
//  Created by Rafael on 29/12/25.
//

protocol ClientFormViewDelegate: AnyObject {
    func didTapCancel()
    func didTapSave()
    func didTapDelete()
}
