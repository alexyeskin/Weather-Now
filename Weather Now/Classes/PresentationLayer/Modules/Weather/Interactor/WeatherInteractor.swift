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
}

// MARK: - WeatherInteractorInput

extension WeatherInteractor: WeatherInteractorInput {
    func getWeather() {
        weatherService.getCurrentWeather { result in
            switch result {
            case .success(let entity):
                DispatchQueue.main.async { [weak self] in
                    self?.output.didGetCurrentWeather(entity: entity)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                // TO DO: Make error handling
            }
        }
    }
}
