//
//  SearchResultDTO.swift
//  MercadolibreMobileTest (iOS)
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

/// API search result mapping object
struct SearchResultDTO: SearchResult {

    /// Current store site
    var siteId: String

    /// Search term used
    var query: String

    /// Result items
    var results: [ItemDTO]
}

extension SearchResultDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case query = "query"
        case results = "results"
    }
}
