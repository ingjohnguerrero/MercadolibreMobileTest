//
//  ItemDTO.swift
//  MercadolibreMobileTest (iOS)
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

struct ItemDTO: Item, Codable {
    
    var id: String
    
    var siteId: String
    
    var title: String
    
    var price: UInt
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case siteId = "site_id"
        case title = "title"
        case price = "price"
    }
    
}
