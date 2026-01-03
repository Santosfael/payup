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
    var selectedIndex: Int
    var onDaySelected : ((Int) -> Void)?
    
    // MARK: - Initialized
    init() {
        let weekDay = calendar.component(.weekday, from: Date())
        self.selectedIndex = (weekDay + 5) % 7
    }
    
    // MARK: - Internal Methods
    internal func selectDay(at index: Int) {
        self.selectedIndex = index
        onDaySelected?(index)
    }

    internal func getSelectedDay() -> Int? {
        return selectedIndex + 1
    }

    internal func setSelectDay(_ day: Int) {
        self.selectedIndex = day - 1
        onDaySelected?(selectedIndex)
    }
}
