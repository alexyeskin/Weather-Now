//
//  ForecastAssembler.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject
import UIKit

class ForecastModuleAssembler: Assembly {
    func assemble(container: Container) {
        container.register(ForecastInteractor.self) { (resolver, presenter: ForecastPresenter) in
            let interactor = ForecastInteractor()
            interactor.output = presenter
            interactor.weatherService = resolver.resolve(WeatherService.self)
            
            return interactor
        }
        
        container.register(ForecastRouter.self) { (_, viewController: ForecastViewController) in
            let router = ForecastRouter()
            router.view = viewController
            
            return router
        }
        
        container.register(ForecastModuleInput.self) { resolver in
            let presenter = ForecastPresenter()
            // swiftlint:disable force_unwrapping
            let viewController = resolver.resolve(ForecastViewController.self, argument: presenter)!
            // swiftlint:enable force_unwrapping
            presenter.view = viewController
            presenter.interactor = resolver.resolve(ForecastInteractor.self, argument: presenter)
            presenter.router = resolver.resolve(ForecastRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.register(ForecastViewController.self) { (_, presenter: ForecastPresenter) in
            // swiftlint:disable force_unwrapping
            let viewController = R.storyboard.main.forecastViewController()!
            // swiftlint:enable force_unwrapping
            viewController.output = presenter
            return viewController
        }
    }
}
