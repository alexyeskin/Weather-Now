//
//  WeatherService.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

protocol WeatherService {
    func getCurrentWeather()
    func getForecast()
}
