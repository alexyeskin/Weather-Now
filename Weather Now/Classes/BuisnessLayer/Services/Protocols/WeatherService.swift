//
//  WeatherService.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

enum StorageError: Error {
    case encodingError
    case decodingError
    case valueNotFound
}

enum WeatherServiceError: Error {
    case innerError
    case networkCoreError(NetworkCoreError)
    case mapperCoreError(MapperCoreError)
    case locationCoreError(LocationCoreError)
    case storageError(StorageError)
}

protocol WeatherService {
    func getCurrentWeather(completion: @escaping (Result<WeatherEntity, WeatherServiceError>) -> Void)
    func getForecast(completion: @escaping (Result<ForecastEntity, WeatherServiceError>) -> Void)
    func getCurrentLocation(completion: @escaping (Result<Void, WeatherServiceError>) -> Void)
}
