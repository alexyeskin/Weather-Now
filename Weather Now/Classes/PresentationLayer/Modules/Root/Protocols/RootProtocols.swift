//
//  RootRootProtocols.swift
//  Weather Now
//
//  Created by Alexander Yeskin on 22.09.2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

protocol RootViewInput: class, Presentable {
    func setupInitialState()
}

protocol RootViewOutput {
    func viewIsReady()
}

protocol RootModuleInput: class {
	var viewController: UIViewController { get }
	var output: RootModuleOutput? { get set }
}

protocol RootModuleOutput: class {
}

protocol RootInteractorInput {
}

protocol RootInteractorOutput: class {
}

protocol RootRouterInput {
    func presentTabBar()
}
