//
//  ForecastViewController.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    var output: ForecastViewOutput!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - ForecastViewInput

extension ForecastViewController: ForecastViewInput {
	func setupInitialState() {
  	}
}
