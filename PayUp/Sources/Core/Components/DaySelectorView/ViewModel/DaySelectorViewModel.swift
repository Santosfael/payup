//
//  DaySelectorViewModel.swift
//  PayUp
//
//  Created by Rafael on 25/12/25.
//

import Foundation

final class DaySelectorViewModel {
    
    // MARK: - Constant Variables
    let days = ["SEG", "TER", "QUA", "QUI", "SEX", "SAB", "DOM"]
    private let calendar = Calendar.current
    
    // MARK: - Variables
    var onDaySelected : ((Int) -> Void)?
    
    var selectedIndex: Int {
        let weekDay = calendar.component(.weekday, from: Date())
        return (weekDay + 5) % 7
    }
    
   
    // MARK: - Public Methods
    func selectDay(at index: Int) {
        onDaySelected?(index)
    }
}
