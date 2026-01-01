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
    private var currentSelectedIndex: Int
    var onDaySelected : ((Int) -> Void)?
    
    var selectedIndex: Int {
        let weekDay = calendar.component(.weekday, from: Date())
        return (weekDay + 5) % 7
    }
    
    // MARK: - Initialized
    init() {
        let weekDay = calendar.component(.weekday, from: Date())
        currentSelectedIndex = (weekDay + 5) % 7
    }
    
   
    // MARK: - Internal Methods
    internal func selectDay(at index: Int) {
        currentSelectedIndex = index
        onDaySelected?(index)
    }

    internal func getSelectedDay() -> Int? {
        return selectedIndex + 1
    }
}
