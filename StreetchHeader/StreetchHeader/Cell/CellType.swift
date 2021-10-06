//
//  CellType.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/05.
//

import Foundation

enum CellType {
    case dayOfWeek(WeatherDaySlotSection)
    case timeHorizontal(WeatherTimeSlotSection)
}

extension CellType: CellAdapter {
    
    var itemCount: Int {
        switch self {
        case .dayOfWeek:
            return 1
        case .timeHorizontal:
            return 1
        }
    }
    
    var identifier: String {
        switch self {
        case .dayOfWeek:
            return DayOfWeekVerticalContainerCell.identifier
            
        case .timeHorizontal:
            return TimeSlotHorizontalContainerCell.identifier
        }
    }
    
//    func item<T>(for index: Int) -> T? where T : Equatable {
//        switch self {
//        case .dayOfWeek(let section):
//            return section.items[index] as? T
//        case .timeHorizontal(let section):
//            return section.items[index] as? T
//        }
//    }
    
    func items<T: Equatable>() -> [T] {
        switch self {
        case .dayOfWeek(let section):
            return section.items as? [T] ?? []
        case .timeHorizontal(let section):
            return section.items as? [T]
                ?? []
        }
    }
}
