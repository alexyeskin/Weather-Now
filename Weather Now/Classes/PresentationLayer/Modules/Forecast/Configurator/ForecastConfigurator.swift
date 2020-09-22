//
//  ForecastConfigurator.swift
//  Weather Now
//
//  Created by Alexander Eskin on 22/09/2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject
import UIKit

class ForecastModuleConfigurator {
    func configureModule() -> ForecastModuleInput {
        // swiftlint:disable force_unwrapping
        let moduleInput = AppDelegate.moduleAssembly.resolver.resolve(ForecastModuleInput.self)!
        // swiftlint:enable force_unwrapping
        return moduleInput
    }
}
