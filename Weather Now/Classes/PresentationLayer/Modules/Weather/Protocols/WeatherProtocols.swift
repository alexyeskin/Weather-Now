//
//  WeatherProtocols.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

protocol WeatherViewInput: class, Presentable {
    func setupInitialState()
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
    func getWeather()
}

protocol WeatherInteractorOutput: class {
}

protocol WeatherRouterInput {
}
