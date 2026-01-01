//
//  ClientFormViewDelegate.swift
//  PayUp
//
//  Created by Rafael on 29/12/25.
//

protocol ClientFormViewDelegate: AnyObject {
    func didTapCancel()
    func didTapSave(client: Client?)
    func didTapDelete()
    func daySelected() -> Int?
}
