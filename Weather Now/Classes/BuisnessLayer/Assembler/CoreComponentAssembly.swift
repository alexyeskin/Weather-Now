//
//  CoreComponentAssembly.swift
//  Weather Now
//
//  Created by Alexander Yeskin on 22.09.2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject

final class CoreComponentAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkCore.self) { _ in
            let core = NetworkCoreImp()
            return core
        }.inObjectScope(.container)
        
        container.register(MapperCore.self) { _ in
            let core = MapperCoreImp()
            return core
        }.inObjectScope(.container)
        
        container.register(LocationCore.self) { _ in
            let core = LocationCoreImp()
            return core
        }.inObjectScope(.container)
    }
}
