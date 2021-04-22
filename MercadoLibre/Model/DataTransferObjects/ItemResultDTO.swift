//
//  ItemsResult.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 6/04/21.
//

import Foundation

/// Single item result
protocol ItemResult {
    var code: Int { get set }
    var item: ItemDTO { get set }
}

/// API item result mapping object
struct ItemResultDTO: ItemResult {
    /// response code
    var code: Int
    
    /// Product response DTO
    var item: ItemDTO
}

extension ItemResultDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case item = "body"
    }
}
