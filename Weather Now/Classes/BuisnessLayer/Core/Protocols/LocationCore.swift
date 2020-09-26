//
//  LocationCore.swift
//  Weather Now
//
//  Created by Alexander Eskin on 24.09.20.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Foundation

enum LocationCoreError: Error {
    case denied
    case notFound
    case failed
}

struct CoordinatesModel: Codable {
    let latitude: String
    let longitude: String
}

protocol LocationCore {
    var locationHandler: ((Result<CoordinatesModel, LocationCoreError>) -> Void)? { get set }
    
    func getLocation(completion: @escaping (Result<CoordinatesModel, LocationCoreError>) -> Void)
}
