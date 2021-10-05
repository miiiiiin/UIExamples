//
//  WeatherTimeSlot.swift
//  StreetchHeader
//
//  Created by Running Raccoon on 2021/10/05.
//

import Foundation

struct WeatherTimeSlot: Equatable, IdentifiableType {
    
    let id: String = UUID().uuidString
    let time: String
    let imageName: String
    let temperature: String
    
    var identity: String {
        return id
    }
}

extension WeatherTimeSlot {
    static let sample: [WeatherTimeSlot] = [
        WeatherTimeSlot(time: "Now", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "12", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "13", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "14", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "15", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "16", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "17", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "18", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "19", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "20", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "21", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "22", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "23", imageName: "wi-sunset", temperature: "20"),
        WeatherTimeSlot(time: "24", imageName: "wi-sunset", temperature: "20")
    ]
}
