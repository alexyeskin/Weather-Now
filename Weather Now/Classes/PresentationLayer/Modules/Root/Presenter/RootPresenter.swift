//
//  RootRootPresenter.swift
//  Weather Now
//
//  Created by Alexander Yeskin on 22.09.2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class RootPresenter {
    weak var view: RootViewInput!
    weak var output: RootModuleOutput?
    
    var interactor: RootInteractorInput!
    var router: RootRouterInput!
}

// MARK: - RootModuleInput

extension RootPresenter: RootModuleInput {
  	var viewController: UIViewController {
    	return view.viewController
  	}
}

// MARK: - RootViewOutput

extension RootPresenter: RootViewOutput {
    func viewIsReady() {
        router.presentTabBar()
    }
}

// MARK: - RootInteractorOutput

extension RootPresenter: RootInteractorOutput {
}
