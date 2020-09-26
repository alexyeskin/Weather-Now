//
//  ForecastInteractor.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

class ForecastInteractor {
    weak var output: ForecastInteractorOutput!
    var weatherService: WeatherService!
    var errorMapper: ErrorMapper!
}

// MARK: - ForecastInteractorInput

extension ForecastInteractor: ForecastInteractorInput {
    func getForecast() {
        weatherService.getForecast { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let entity):
                DispatchQueue.main.async { [weak self] in
                    self?.output.didGetForecast(entity: entity)
                }
                
            case .failure(let error):
                let mappedError = self.errorMapper.mapWeatherError(error)
                DispatchQueue.main.async { [weak self] in
                    self?.output.didFailedGetLocation(error: mappedError)
                }
            }
        }
    }
}
