//
//  NetworkCore.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

enum NetworkCoreError: Error {
    case badURL
    case badResponse
    case networkError
}

protocol NetworkCore {
    func loadCurrentWeather(
        from coordinates: CoordinatesModel,
        completion: @escaping (Result<WeatherResponseModel, NetworkCoreError>) -> Void
    )
    
    func loadForecast(
        from coordinates: CoordinatesModel,
        completion: @escaping (Result<ForecastResponseModel, NetworkCoreError>) -> Void
    )
}
