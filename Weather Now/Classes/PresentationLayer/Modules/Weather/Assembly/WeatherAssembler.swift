//
//  WeatherAssembler.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject
import UIKit

class WeatherModuleAssembler: Assembly {
    func assemble(container: Container) {
        container.register(WeatherInteractor.self) { (_, presenter: WeatherPresenter) in
            let interactor = WeatherInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(WeatherRouter.self) { (_, viewController: WeatherViewController) in
            let router = WeatherRouter()
            router.view = viewController
            
            return router
        }
        
        container.register(WeatherModuleInput.self) { resolver in
            let presenter = WeatherPresenter()
            // swiftlint:disable force_unwrapping
            let viewController = resolver.resolve(WeatherViewController.self, argument: presenter)!
            // swiftlint:enable force_unwrapping
            presenter.view = viewController
            presenter.interactor = resolver.resolve(WeatherInteractor.self, argument: presenter)
            presenter.router = resolver.resolve(WeatherRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.register(WeatherViewController.self) { (_, presenter: WeatherPresenter) in
            // swiftlint:disable force_unwrapping
            let viewController = R.storyboard.main.weatherViewController()!
            // swiftlint:enable force_unwrapping
            viewController.output = presenter
            return viewController
        }
    }
}
