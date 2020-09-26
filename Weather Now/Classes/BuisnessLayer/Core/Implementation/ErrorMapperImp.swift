//
//  ErrorMapperImp.swift
//  Weather Now
//
//  Created by Alexander Eskin on 26.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

class ErrorMapperImp: ErrorMapper {
    func mapWeatherError(_ error: WeatherServiceError) -> String {
        switch error {
        case .innerError:
            return "Inner Error"
            
        case .locationCoreError(let error):
            return mapLocationCoreError(error)
            
        case .mapperCoreError(let error):
            return mapMapperCoreError(error)
            
        case .networkCoreError(let error):
            return mapNetworkCoreError(error)
            
        case .storageError(let error):
            return mapStorageError(error)
        }
    }
    
    // MARK: Private
    
    private func mapLocationCoreError(_ error: LocationCoreError) -> String {
        switch error {
        case .denied:
            return "Location services is denied"
            
        case .failed:
            return "Location services failed"
            
        case .notFound:
            return "Can't found your location"
        }
    }
    
    private func mapMapperCoreError(_ error: MapperCoreError) -> String {
        switch error {
        case .noWeatherDescription:
            return "Weather information is unable"
        }
    }
    
    private func mapNetworkCoreError(_ error: NetworkCoreError) -> String {
        switch error {
        case .badURL:
            return "Server URL is not correct"
            
        case .badResponse:
            return "Bad server response"
            
        case .networkError:
            return "Check your internet connection"
        }
    }
    
    private func mapStorageError(_ error: StorageError) -> String {
        switch error {
        case .decodingError:
            return "Can't get location"
            
        case .encodingError:
            return "Cant't save location"
            
        case .valueNotFound:
            return "Saved location not found"
        }
    }
}
