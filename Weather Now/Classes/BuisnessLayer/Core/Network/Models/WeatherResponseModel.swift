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
    let temperature: Int
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
    }
}

struct WeatherWindResponseModel: Decodable {
    let speed: Int
    let degree: Int
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
    }
}

enum WeatherDescriptionType: String, Decodable {
    case thunderstorm = "Thunderstorm"
    case drizzle = "Drizzle"
    case rain = "Rain"
    case snow = "Snow"
    case atmosphere = "Atmosphere"
    case clear = "Clear"
    case clouds = "Clouds"
}

struct WeatherDescriptionResponseModel: Decodable {
    let description: WeatherDescriptionType
    
    enum CodingKeys: String, CodingKey {
        case description = "main"
    }
}

struct WeatherAdditionalsResponseModel: Decodable {
    let country: String
}
