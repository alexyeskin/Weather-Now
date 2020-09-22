//
//  WeatherPresenter.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class WeatherPresenter {
    weak var view: WeatherViewInput!
    weak var output: WeatherModuleOutput?
    
    var interactor: WeatherInteractorInput!
    var router: WeatherRouterInput!
}

// MARK: - WeatherModuleInput

extension WeatherPresenter: WeatherModuleInput {
  	var viewController: UIViewController {
    	return view.viewController
  	}
}

// MARK: - WeatherViewOutput

extension WeatherPresenter: WeatherViewOutput {
    func viewIsReady() {
        interactor.getWeather()
    }
}

// MARK: - WeatherInteractorOutput

extension WeatherPresenter: WeatherInteractorOutput {
}
