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
}

// MARK: - WeatherInteractorInput

extension WeatherInteractor: WeatherInteractorInput {
}
