//
//  Sections.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/05.
//

import Foundation

struct WeatherDaySlotSection: SectionModelType {
    var items: [WeatherDaySlot]
    
    var identity: String {
        return "daySection"
    }
    
    init(items: [WeatherDaySlot]) {
        self.items = items
    }
}

struct WeatherTimeSlotSection: SectionModelType {
    var items: [WeatherTimeSlot]
    
    var identity: String {
        return "timeSection"
    }
    
    init(items: [WeatherTimeSlot]) {
        self.items = items
    }
}
