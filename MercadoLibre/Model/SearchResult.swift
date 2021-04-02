//
//  SearchResult.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

protocol SearchResult {
    var siteId: String { get set }
    var query: String { get set }
    var results: [ItemDTO] { get set }
}
