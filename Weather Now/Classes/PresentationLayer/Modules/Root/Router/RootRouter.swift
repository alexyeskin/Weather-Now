//
//  RootRootRouter.swift
//  Weather Now
//
//  Created by Alexander Yeskin on 22.09.2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class RootRouter: RootRouterInput {
	weak var view: UIViewController?

    var childs = NSPointerArray.weakObjects()
}

extension RootRouter {
    func presentTabBar() {
        guard let view = view else {
            return
        }
        
        let module = TabBarModuleConfigurator().configureModule()
        view.addChildController(module.viewController)
    }
}
