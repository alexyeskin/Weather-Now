//
//  WeatherInteractor.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

class WeatherInteractor {
    weak var output: WeatherInteractorOutput!
    var weatherService: WeatherService!
    var errorMapper: ErrorMapper!
}

// MARK: - WeatherInteractorInput

extension WeatherInteractor: WeatherInteractorInput {
    func getLocation() {
        weatherService.getCurrentLocation { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success:
                DispatchQueue.main.async { [weak self] in
                    self?.output.didGetLocation()
                }
                
            case .failure(let error):
                let mappedError = self.errorMapper.mapWeatherError(error)
                DispatchQueue.main.async { [weak self] in
                    self?.output.didFailedGetLocation(error: mappedError)
                }
            }
        }
    }
    
    func getWeather() {
        weatherService.getCurrentWeather { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let entity):
                DispatchQueue.main.async { [weak self] in
                    self?.output.didGetCurrentWeather(entity: entity)
                }
                
            case .failure(let error):
                let mappedError = self.errorMapper.mapWeatherError(error)
                DispatchQueue.main.async { [weak self] in
                    self?.output.didFailedGetLocation(error: mappedError)
                }
            }
        }
    }
    
    func obtainShareInfo(entity: WeatherEntity) -> String {
        let shareInfo = "Temperature \(entity.temperature)°C in \(entity.city) \(entity.country)"
        return shareInfo
    }
}
