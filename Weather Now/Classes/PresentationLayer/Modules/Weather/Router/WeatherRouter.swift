//
//  WeatherRouter.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class WeatherRouter {
	weak var view: UIViewController?
}

// MARK: - WeatherRouterInput

extension WeatherRouter: WeatherRouterInput {
    func shareInfo(text: String) {
        guard let view = view else {
            return
        }
        
        let activityViewController = UIActivityViewController(
            activityItems: [text],
            applicationActivities: nil
        )
        activityViewController.popoverPresentationController?.sourceView = view.view
        view.present(activityViewController, animated: true, completion: nil)
    }
    
    func showAlert(message: String) {
        guard let view = view else {
            return
        }
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
}
