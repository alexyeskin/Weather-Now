//
//  WeatherService.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

enum WeatherServiceError: Error {
    case error
    case innerError
    case mapperCoreError(MapperCoreError)
}

protocol WeatherService {
    func getCurrentWeather(completion: @escaping (Result<WeatherEntity, WeatherServiceError>) -> Void)
    func getForecast()
}
