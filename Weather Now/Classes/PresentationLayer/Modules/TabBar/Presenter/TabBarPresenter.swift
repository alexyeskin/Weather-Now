//
//  TabBarPresenter.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class TabBarPresenter {
    weak var view: TabBarViewInput!
    weak var output: TabBarModuleOutput?
    
    var interactor: TabBarInteractorInput!
    var router: TabBarRouterInput!
}

// MARK: - TabBarModuleInput

extension TabBarPresenter: TabBarModuleInput {
  	var viewController: UIViewController {
    	return view.viewController
  	}
}

// MARK: - TabBarViewOutput

extension TabBarPresenter: TabBarViewOutput {
    func viewIsReady() {
        let weatherModule = router.getWeatherModule()
        let forecastModule = router.getForecastModule()
        view.setupInitialState(weatherModule: weatherModule, forecastModule: forecastModule)
    }
}

// MARK: - TabBarInteractorOutput

extension TabBarPresenter: TabBarInteractorOutput {
}
