//
//  WeatherEntity.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

struct WeatherEntity {
    let city: String
    let country: String
    let temperature: Int
    let description: String
    let imageName: String
    let additionalInfo: [WeatherAdditionalInfoEntity]
}

struct WeatherAdditionalInfoEntity {
    let imageName: String
    let text: String
}
