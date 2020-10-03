//
//  MapperCoreImp.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

final class MapperCoreImp: MapperCore {
    func mapWeatherResponseModel(_ model: WeatherResponseModel) throws -> WeatherEntity {
        guard let description = model.descriptions.first else {
            throw MapperCoreError.noWeatherDescription
        }
        
        let entity = WeatherEntity(
            city: model.cityName,
            country: model.additionals.country,
            temperature: Int(round(model.info.temperature)),
            description: description.description.rawValue.capitalized,
            imageName: mapImageName(from: description.description),
            additionalInfo: mapAdditionals(model)
        )
        
        return entity
    }
    
    func mapForecastResponseModel(_ model: ForecastResponseModel) throws -> ForecastEntity {
        let sortedItems = model.items.sorted { $0.date < $1.date }
        let hourEntities = mapForecastItems(sortedItems)
        let groupedHours = groupHoursByDays(hours: hourEntities)
        let days = groupedHours.map {
            ForecastDayEntity(dayTitle: getWeekday(from: $0.first?.date), hours: $0)
        }
        let entity = ForecastEntity(days: days)
        return entity
    }
    
    // MARK: Private
    
    private func mapAdditionals(_ model: WeatherResponseModel) -> [WeatherAdditionalInfoEntity] {
        let humidity = WeatherAdditionalInfoEntity(
            imageName: "cloud.drizzle",
            text: String(Int(model.info.humidity)) + "%"
        )
        let pressure = WeatherAdditionalInfoEntity(
            imageName: "thermometer",
            text: String(Int(model.info.pressure)) + " hPa"
        )
        let windSpeed = WeatherAdditionalInfoEntity(
            imageName: "wind",
            text: String(model.wind.speed) + " m/s"
        )
        let windDirection = WeatherAdditionalInfoEntity(
            imageName: "safari", text: String(model.wind.degree) + "°"
        )
        
        return [humidity, pressure, windSpeed, windDirection]
    }
    
    private func mapImageName(from type: WeatherDescriptionType) -> String {
        switch type {
        case .atmosphere:
            return "cloud.fog"
            
        case .clear:
            return "sun.max"
            
        case .clouds:
            return "cloud"
            
        case .drizzle:
            return "cloud.drizzle"
            
        case .rain:
            return "cloud.rain"
            
        case .snow:
            return "snow"
            
        case .thunderstorm:
            return "tropicalstorm"
            
        }
    }
    
    private func mapForecastItems(_ items: [ForecastItemResponseModel]) -> [ForecastHourEntity] {
        var hourEntities = [ForecastHourEntity]()
        for item in items {
            guard let description = item.descriptions.first else {
                continue
            }
            
            let hourEntity = ForecastHourEntity(
                imageName: mapImageName(from: description.type),
                date: item.date,
                description: description.description,
                temperature: Int(round(item.info.temperature))
            )
            
            hourEntities.append(hourEntity)
        }
        
        return hourEntities
    }
    
    private func groupHoursByDays(hours: [ForecastHourEntity]) -> [[ForecastHourEntity]] {
        let groupedHours = Dictionary(grouping: hours, by: { getShortDateString(date: $0.date) })
            .sorted(by: { $0.key < $1.key })
            .map { $0.value }
        
        return groupedHours
    }
    
    private func getShortDateString(date: Date) -> Date {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let shortDate = formatter.string(from: date)
        if let date = formatter.date(from: shortDate) {
            return date
        }
        
        return Date()
    }
    
    private func getWeekday(from date: Date?) -> String {
        guard let date = date else {
            return "Monday"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
