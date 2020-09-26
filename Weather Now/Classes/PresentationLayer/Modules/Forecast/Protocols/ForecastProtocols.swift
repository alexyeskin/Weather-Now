//
//  ForecastProtocols.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

protocol ForecastViewInput: class, Presentable {
    func setupInitialState(entity: ForecastEntity)
}

protocol ForecastViewOutput {
    func viewIsReady()
}

protocol ForecastModuleInput: class {
	var viewController: UIViewController { get }
	var output: ForecastModuleOutput? { get set }
}

protocol ForecastModuleOutput: class {
}

protocol ForecastInteractorInput {
    func getForecast()
}

protocol ForecastInteractorOutput: class {
    func didGetForecast(entity: ForecastEntity)
}

protocol ForecastRouterInput {
}
