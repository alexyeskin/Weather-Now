//
//  WeatherResponseModel.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

struct WeatherResponseModel: Decodable {
    let cityName: String
    let info: WeatherInfoResponseModel
    let wind: WeatherWindResponseModel
    let descriptions: [WeatherDescriptionResponseModel]
    let additionals: WeatherAdditionalsResponseModel
    
    enum CodingKeys: String, CodingKey {
        case cityName = "name"
        case info = "main"
        case wind
        case descriptions = "weather"
        case additionals = "sys"
    }
}

struct WeatherInfoResponseModel: Decodable {
    let temperature: Double
    let pressure: Double
    let humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
    }
}

struct WeatherWindResponseModel: Decodable {
    let speed: Double
    let degree: Int
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
}

struct WeatherDescriptionResponseModel: Decodable {
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case description = "main"
    }
}

struct WeatherAdditionalsResponseModel: Decodable {
    let country: String
}
