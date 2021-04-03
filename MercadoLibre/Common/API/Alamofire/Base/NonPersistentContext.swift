//
//  NonPersistentContext.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

class NonPersistentContext: APIContext {
    var environment: APIEnvironment

    init(environment: APIEnvironment) {
        self.environment = environment
    }
}
