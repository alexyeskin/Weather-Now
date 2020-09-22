//
//  ForecastProtocols.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

protocol ForecastViewInput: class, Presentable {
    func setupInitialState()
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
}

protocol ForecastInteractorOutput: class {
}

protocol ForecastRouterInput {
}
