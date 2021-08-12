//
//  WeatherDay.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/08/12.
//

import Foundation

struct WeatherDay: Equatable, IdentifiableType {
    
    let id: String = UUID().uuidString
    let dayOfWeek: DayOfWeek
    let imgName: String
    let highestTemperature: Float
    let lowestTemperature: Float

    var identity: String {
        return id
    }
}

extension WeatherDay {
    static let sample: [WeatherDay] = {
        let items: [WeatherDay] = [
            WeatherDay(dayOfWeek: .monday, imgName: "wi-sunset", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .tuesday, imgName: "wi-cloud", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .wednesday, imgName: "wi-sunset", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .thursday, imgName: "wi-alien", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .friday, imgName: "wi-alien", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .saturday, imgName: "wi-sunset", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .monday, imgName: "wi-sunset", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .tuesday, imgName: "wi-cloud", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .wednesday, imgName: "wi-sunset", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .thursday, imgName: "wi-alien", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .friday, imgName: "wi-alien", highestTemperature: 31, lowestTemperature: 20),
            WeatherDay(dayOfWeek: .saturday, imgName: "wi-sunset", highestTemperature: 31, lowestTemperature: 20)
        ]
        return items
    }()
}
