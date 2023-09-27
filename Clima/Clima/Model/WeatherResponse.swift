//
//  WeatherResponse.swift
//  Clima
//
//  Created by CEMTREX on 27/09/23.
//

import Foundation

struct WeatherResponse: Codable{
    let name:String
    let main:Main
    let weather:[Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let description: String
    let id: Int
}
