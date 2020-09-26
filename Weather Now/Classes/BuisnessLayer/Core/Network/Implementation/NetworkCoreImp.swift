//
//  NetworkCoreImp.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Alamofire
import Foundation

final class NetworkCoreImp: NetworkCore {
    func loadCurrentWeather(
        from coordinates: CoordinatesModel,
        completion: @escaping (Result<WeatherResponseModel, NetworkCoreError>) -> Void
    ) {
        guard let url = URL(string: "\(Constants.baseURL)/weather") else {
            completion(.failure(.badURL))
            return
        }
        
        let parameters: Parameters = [
            "lat": coordinates.latitude,
            "lon": coordinates.longitude,
            "units": "metric",
            "appid": Constants.apiKey
        ]
        
        AF.request(
            url,
            parameters: parameters
        ).responseData { response in
            switch response.result {
            case .success(let data):
                guard let model = try? JSONDecoder().decode(WeatherResponseModel.self, from: data) else {
                    completion(.failure(.badResponse))
                    return
                }
                completion(.success(model))
                
            case .failure(let error):
                completion(.failure(.networkError))
                print(error.localizedDescription)
            }
        }
    }
    
    func loadForecast(
        from coordinates: CoordinatesModel,
        completion: @escaping (Result<ForecastResponseModel, NetworkCoreError>) -> Void
    ) {
        guard let url = URL(string: "\(Constants.baseURL)/forecast") else {
            completion(.failure(.badURL))
            return
        }
        let parameters: Parameters = [
            "lat": coordinates.latitude,
            "lon": coordinates.longitude,
            "units": "metric",
            "appid": Constants.apiKey
        ]
        
        AF.request(
            url,
            parameters: parameters,
            encoding: URLEncoding.queryString
        ).responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                guard let model = try? decoder.decode(ForecastResponseModel.self, from: data) else {
                    completion(.failure(.badResponse))
                    return
                }
                completion(.success(model))
                
            case .failure(let error):
                completion(.failure(.networkError))
                print(error.localizedDescription)
            }
        }
    }
}
