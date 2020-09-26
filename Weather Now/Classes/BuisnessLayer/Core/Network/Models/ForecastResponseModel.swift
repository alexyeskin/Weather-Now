//
//  ForecastResponseModel.swift
//  Weather Now
//
//  Created by Alexander Eskin on 24.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

struct ForecastResponseModel: Decodable {
    let items: [ForecastItemResponseModel]
    let cityInfo: ForecastCityResponseModel
    
    enum CodingKeys: String, CodingKey {
        case items = "list"
        case cityInfo = "city"
    }
}

struct ForecastItemResponseModel: Decodable {
    let info: ForecastItemInfoResponseModel
    let descriptions: [ForecastDescriptionResponseModel]
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case info = "main"
        case descriptions = "weather"
        case date = "dt"
    }
}

struct ForecastItemInfoResponseModel: Decodable {
    let temperature: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}

struct ForecastDescriptionResponseModel: Decodable {
    let type: WeatherDescriptionType
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case type = "main"
        case description
    }
}

struct ForecastCityResponseModel: Decodable {
    let name: String
}
