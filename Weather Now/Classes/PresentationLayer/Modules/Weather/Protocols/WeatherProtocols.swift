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
    func actionShare(entity: WeatherEntity)
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
    func obtainShareInfo(entity: WeatherEntity) -> String
}

protocol WeatherInteractorOutput: class {
    func didGetLocation()
    func didGetCurrentWeather(entity: WeatherEntity)
    func didFailedGetLocation(error: String)
}

protocol WeatherRouterInput {
    func shareInfo(text: String)
    func showAlert(message: String)
}
