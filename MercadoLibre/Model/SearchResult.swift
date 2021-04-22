//
//  SearchResult.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

/// Search result interface
protocol SearchResult {
    /// Country store id
    var siteId: String { get set }
    /// Search term used
    var query: String { get set }
    /// Result items DTOs
    var results: [ItemDTO] { get set }
}
