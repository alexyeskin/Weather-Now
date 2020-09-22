//
//  ModuleAssembly.swift
//  Weather Now
//
//  Created by Alexander Yeskin on 22.09.2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject

class ModuleAssembly {
    fileprivate let assembler: Assembler!
    
    public var resolver: Resolver {
        return assembler.resolver
    }
    
    init(parent: Assembler) {
        assembler = Assembler(
            [
                RootModuleAssembler(),
                TabBarModuleAssembler(),
                WeatherModuleAssembler(),
                ForecastModuleAssembler()
            ],
            parent: parent
        )
    }
}
