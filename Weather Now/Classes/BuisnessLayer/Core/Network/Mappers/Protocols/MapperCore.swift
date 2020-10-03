//
//  MapperCore.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

enum MapperCoreError: Error {
    case noWeatherDescription
}

protocol MapperCore {
    func mapWeatherResponseModel(_ model: WeatherResponseModel) throws -> WeatherEntity
    func mapForecastResponseModel(_ model: ForecastResponseModel) throws -> ForecastEntity
}
