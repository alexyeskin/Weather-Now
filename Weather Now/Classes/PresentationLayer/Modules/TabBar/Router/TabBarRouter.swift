//
//  TabBarRouter.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class TabBarRouter {
	weak var view: UIViewController?
}

// MARK: - TabBarRouterInput

extension TabBarRouter: TabBarRouterInput {
    func getWeatherModule() -> WeatherModuleInput {
        let module = WeatherModuleConfigurator().configureModule()
        return module
    }
    
    func getForecastModule() -> ForecastModuleInput {
        let module = ForecastModuleConfigurator().configureModule()
        return module
    }
}
