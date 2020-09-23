//
//  ServicesAssembly.swift
//  Weather Now
//
//  Created by Alexander Yeskin on 22.09.2020.
//  Copyright © 2020 Alexander Yeskin. All rights reserved.
//

import Swinject

final class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(WeatherService.self) { resolver in
            let service = WeatherServiceImp()
            service.networkCore = resolver.resolve(NetworkCore.self)
            service.mapperCore = resolver.resolve(MapperCore.self)
            return service
        }
    }
}
