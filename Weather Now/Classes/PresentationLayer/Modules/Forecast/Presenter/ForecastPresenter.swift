//
//  ForecastPresenter.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class ForecastPresenter {
    weak var view: ForecastViewInput!
    weak var output: ForecastModuleOutput?
    
    var interactor: ForecastInteractorInput!
    var router: ForecastRouterInput!
}

// MARK: - ForecastModuleInput

extension ForecastPresenter: ForecastModuleInput {
  	var viewController: UIViewController {
    	return view.viewController
  	}
}

// MARK: - ForecastViewOutput

extension ForecastPresenter: ForecastViewOutput {
    func viewIsReady() {
        interactor.getForecast()
    }
}

// MARK: - ForecastInteractorOutput

extension ForecastPresenter: ForecastInteractorOutput {
    func didGetForecast(entity: ForecastEntity) {
        view.setupInitialState(entity: entity)
    }
    
    func didFailedGetLocation(error: String) {
        router.showAlert(message: error)
    }
}
