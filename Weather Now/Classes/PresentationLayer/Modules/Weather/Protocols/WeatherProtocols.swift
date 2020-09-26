//
//  WeatherProtocols.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

protocol WeatherViewInput: class, Presentable {
    func setupInitialState(entity: WeatherEntity)
}

protocol WeatherViewOutput {
    func viewIsReady()
}

protocol WeatherModuleInput: class {
	var viewController: UIViewController { get }
	var output: WeatherModuleOutput? { get set }
}

protocol WeatherModuleOutput: class {
}

protocol WeatherInteractorInput {
    func getLocation()
    func getWeather()
}

protocol WeatherInteractorOutput: class {
    func didGetLocation()
    func didGetCurrentWeather(entity: WeatherEntity)
}

protocol WeatherRouterInput {
}
