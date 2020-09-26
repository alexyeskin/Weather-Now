//
//  ErrorMapper.swift
//  Weather Now
//
//  Created by Alexander Eskin on 26.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

protocol ErrorMapper {
    func mapWeatherError(_ error: WeatherServiceError) -> String
}
