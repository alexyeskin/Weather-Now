//
//  NetworkCore.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22.09.20.
//  Copyright © 2020 PixelPlex. All rights reserved.
//

import Foundation

enum NetworkCoreError: Error {
    case badURL
    case noConnection
}

protocol NetworkCore {
    func loadForecast(completion: (Result<String, NetworkCoreError>) -> Void)
}
