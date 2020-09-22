//
//  TabBarProtocols.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

protocol TabBarViewInput: class, Presentable {
    func setupInitialState(weatherModule: WeatherModuleInput, forecastModule: ForecastModuleInput)
}

protocol TabBarViewOutput {
    func viewIsReady()
}

protocol TabBarModuleInput: class {
	var viewController: UIViewController { get }
	var output: TabBarModuleOutput? { get set }
}

protocol TabBarModuleOutput: class {
}

protocol TabBarInteractorInput {
}

protocol TabBarInteractorOutput: class {
}

protocol TabBarRouterInput {
    func getWeatherModule() -> WeatherModuleInput
    func getForecastModule() -> ForecastModuleInput
}
