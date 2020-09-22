//
//  TabBarViewController.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var output: TabBarViewOutput!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - TabBarViewInput

extension TabBarController: TabBarViewInput {
    func setupInitialState(weatherModule: WeatherModuleInput, forecastModule: ForecastModuleInput) {
        viewControllers = [
            weatherModule.viewController,
            forecastModule.viewController
        ]
    }
}
