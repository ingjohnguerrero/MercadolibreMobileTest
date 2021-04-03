//
//  SearchResultDTO.swift
//  MercadolibreMobileTest (iOS)
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

struct SearchResultDTO: SearchResult {

    var siteId: String

    var query: String

    var results: [ItemDTO]
}

extension SearchResultDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case query = "query"
        case results = "results"
    }
}
