//
//  ForecastEntity.swift
//  Weather Now
//
//  Created by Alexander Eskin on 24.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

struct ForecastEntity {
    let days: [ForecastDayEntity]
}

struct ForecastDayEntity {
    let dayTitle: String
    let hours: [ForecastHourEntity]
}

struct ForecastHourEntity {
    let imageName: String
    let date: Date
    let description: String
    let temperature: Int
    
    var stringDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
