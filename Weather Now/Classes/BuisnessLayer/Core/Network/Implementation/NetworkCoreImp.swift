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
                    completion(.failure(.decodingError))
                    return
                }
                completion(.success(model))
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadForecast(
        from coordinates: CoordinatesModel,
        completion: @escaping (Result<String, NetworkCoreError>) -> Void
    ) {
        //api.openweathermap.org/data/2.5/forecast?lat=53.9&lon=27.56667&appid=9b3be2f2d86aa88f89de13745272a15e
        guard let url = URL(string: "\(Constants.baseURL)forecast") else {
            completion(.failure(.badURL))
            return
        }
        let parameters: Parameters = [
            "lat": coordinates.latitude,
            "lon": coordinates.longitude,
            "appid": Constants.apiKey
        ]
        
        AF.request(
            url,
            parameters: parameters,
            encoding: URLEncoding.queryString
        ).responseData { response in
            switch response.result {
            case .success(let data):
                print(data.description)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
