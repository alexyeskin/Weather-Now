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
    weak var splash: UIViewController?
    weak var verification: UIViewController?
    weak var blockScreen: UIViewController?

    var childs = NSPointerArray.weakObjects()
}

extension RootRouter {
}
