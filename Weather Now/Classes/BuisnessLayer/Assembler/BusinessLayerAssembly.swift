//
//  BusinessLayerAssembly.swift
//  Weather Now
//
//  Created by Alexander Yeskin on 22.09.2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject

class BusinessLayerAssembly {
    init(parent: Assembler) {
        let assemblies: [Assembly] = [ServicesAssembly(), CoreComponentAssembly(), ProxyAssembly()]
        parent.apply(assemblies: assemblies)
    }
}
