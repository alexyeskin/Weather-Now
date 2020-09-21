//
//  RootRootAssembler.swift
//  Weather Now
//
//  Created by Alexander Yeskin on 22.09.2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject
import UIKit

class RootModuleAssembler: Assembly {
    func assemble(container: Container) {
        container.register(RootInteractor.self) { ( _, presenter: RootPresenter) in
            let interactor = RootInteractor()
            interactor.output = presenter
            
            return interactor
        }
        
        container.register(RootRouter.self) { (_, viewController: RootViewController) in
            let router = RootRouter()
            router.view = viewController
            
            return router
        }
        
        container.register(RootModuleInput.self) { resolver in
            let presenter = RootPresenter()
            
            let viewController = resolver.resolve(RootViewController.self, argument: presenter)
            
            presenter.view = viewController
            presenter.interactor = resolver.resolve(RootInteractor.self, argument: presenter)
            presenter.router = resolver.resolve(RootRouter.self, argument: viewController)
            
            return presenter
        }
        
        container.register(RootViewController.self) { (_, presenter: RootPresenter) in
            // swiftlint:disable force_unwrapping
            let viewController = R.storyboard.root.rootViewController()!
            viewController.output = presenter
            return viewController
            // swiftlint:enable force_unwrapping
        }
    }
}
