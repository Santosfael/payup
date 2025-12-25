//
//  DaySelectorViewDelegate.swift
//  PayUp
//
//  Created by Rafael on 25/12/25.
//

protocol DaySelectorViewDelegate: AnyObject {
    func daySelectorView(_ view: DaySelectorView, didSelectDayAt index: Int)
}
