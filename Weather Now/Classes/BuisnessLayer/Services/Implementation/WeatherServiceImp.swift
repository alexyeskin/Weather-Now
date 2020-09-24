//
//  WeatherServiceImp.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

final class WeatherServiceImp: WeatherService {
    var networkCore: NetworkCore!
    var mapperCore: MapperCore!
    
    func getCurrentWeather(completion: @escaping (Result<WeatherEntity, WeatherServiceError>) -> Void) {
        let coordinates = CoordinatesModel(latitude: Constants.latitude, longitude: Constants.longitude)
        
        networkCore.loadCurrentWeather(from: coordinates) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let model):
                do {
                    let entity = try self.mapperCore.mapWeatherResponseModel(model)
                    completion(.success(entity))
                } catch let error as MapperCoreError {
                    completion(.failure(.mapperCoreError(error)))
                } catch {
                    completion(.failure(.innerError))
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getForecast() {
        let coordinates = CoordinatesModel(latitude: "1", longitude: "2")
        
        networkCore.loadForecast(from: coordinates) { result in
            switch result {
            case .success(let forecast):
                print(forecast)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
