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
    var locationCore: LocationCore!
    
    func getCurrentWeather(completion: @escaping (Result<WeatherEntity, WeatherServiceError>) -> Void) {
        guard let coordinates = try? getCoordinates() else {
            completion(.failure(.locationCoreError(.notFound)))
            return
        }
        
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
                completion(.failure(.networkCoreError(error)))
            }
        }
    }
    
    func getForecast(completion: @escaping (Result<ForecastEntity, WeatherServiceError>) -> Void) {
        guard let coordinates = try? getCoordinates() else {
            completion(.failure(.locationCoreError(.notFound)))
            return
        }
        
        networkCore.loadForecast(from: coordinates) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let model):
                do {
                    let entity = try self.mapperCore.mapForecastResponseModel(model)
                    completion(.success(entity))
                } catch let error as MapperCoreError {
                    completion(.failure(.mapperCoreError(error)))
                } catch {
                    completion(.failure(.innerError))
                }
                
            case .failure(let error):
                completion(.failure(.networkCoreError(error)))
            }
        }
    }
    
    func getCurrentLocation(completion: @escaping (Result<Void, WeatherServiceError>) -> Void) {
        locationCore.getLocation { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let coordinates):
                do {
                    try self.storeCoordinates(coordinates)
                } catch let error as StorageError {
                    completion(.failure(.storageError(error)))
                } catch {
                    completion(.failure(.innerError))
                }
                
                completion(.success(()))
                
            case .failure(let error):
                completion(.failure(.locationCoreError(error)))
            }
        }
    }
    
    private func storeCoordinates(_ coordinates: CoordinatesModel) throws {
        if let encoded = try? JSONEncoder().encode(coordinates) {
            UserDefaults.standard.set(encoded, forKey: Constants.coordinatesKey)
        } else {
            throw StorageError.encodingError
        }
    }
    
    private func getCoordinates() throws -> CoordinatesModel {
        guard let data = UserDefaults.standard.object(forKey: Constants.coordinatesKey) as? Data else {
            throw StorageError.valueNotFound
        }
        
        guard let coordinates = try? JSONDecoder().decode(CoordinatesModel.self, from: data) else {
            throw StorageError.decodingError
        }
        
        return coordinates
    }
}
