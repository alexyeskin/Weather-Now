//
//  TabBarAssembler.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject
import UIKit

class TabBarModuleAssembler: Assembly {
    func assemble(container: Container) {
        container.register(TabBarInteractor.self) { (_, presenter: TabBarPresenter) in
            let interactor = TabBarInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(TabBarRouter.self) { (_, viewController: TabBarController) in
            let router = TabBarRouter()
            router.view = viewController
            
            return router
        }
        
        container.register(TabBarModuleInput.self) { resolver in
            let presenter = TabBarPresenter()
            // swiftlint:disable force_unwrapping
            let viewController = resolver.resolve(TabBarController.self, argument: presenter)!
            // swiftlint:enable force_unwrapping
            presenter.view = viewController
            presenter.interactor = resolver.resolve(TabBarInteractor.self, argument: presenter)
            presenter.router = resolver.resolve(TabBarRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.register(TabBarController.self) { (_, presenter: TabBarPresenter) in
            // swiftlint:disable force_unwrapping
            let viewController = R.storyboard.main.tabBarController()!
            // swiftlint:enable force_unwrapping
            viewController.output = presenter
            return viewController
        }
    }
}
