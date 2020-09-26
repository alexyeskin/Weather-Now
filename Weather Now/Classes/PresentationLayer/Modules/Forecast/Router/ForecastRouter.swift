//
//  ForecastRouter.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class ForecastRouter {
	weak var view: UIViewController?
}

// MARK: - ForecastRouterInput

extension ForecastRouter: ForecastRouterInput {
    func showAlert(message: String) {
        guard let view = view else {
            return
        }
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
}
