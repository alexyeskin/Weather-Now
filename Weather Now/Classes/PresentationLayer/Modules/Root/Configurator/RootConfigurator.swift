//
//  RootRootConfigurator.swift
//  Weather Now
//
//  Created by Alexander Yeskin on 22.09.2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject
import UIKit

class RootModuleConfigurator {
    func configureModule () -> RootModuleInput {
        // swiftlint:disable force_unwrapping
        let moduleInput = AppDelegate.moduleAssembly.resolver.resolve(RootModuleInput.self)!
        return moduleInput
        // swiftlint:enable force_unwrapping
    }
}
