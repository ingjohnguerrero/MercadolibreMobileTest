//
//  ItemsResult.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 6/04/21.
//

import Foundation

protocol ItemResult {
    // associatedtype ItemDTO
    var code: Int { get set }
    var item: ItemDTO { get set }
}

struct ItemResultDTO: ItemResult {
    var code: Int
    var item: ItemDTO
}

extension ItemResultDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case item = "body"
    }
}
