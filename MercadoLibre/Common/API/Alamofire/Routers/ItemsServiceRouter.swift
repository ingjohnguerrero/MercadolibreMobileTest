//
//  ItemsServiceRouter.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

enum ItemsServiceRouter: APIRoute {
    case searchItemsByTerm

    var path: String {
        switch self {
        case .searchItemsByTerm:
            return "sites/MCO/search"
        }
    }
}
