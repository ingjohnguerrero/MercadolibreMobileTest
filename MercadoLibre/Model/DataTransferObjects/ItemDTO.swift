//
//  ItemDTO.swift
//  MercadolibreMobileTest (iOS)
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

struct ItemDTO: Item {

    var id: String

    var siteId: String

    var title: String

    var price: UInt

    var thumbnailUrl: String?

    var pictures: [PictureDTO]?
}

extension ItemDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case siteId = "site_id"
        case title = "title"
        case price = "price"
        case thumbnailUrl = "thumbnail"
        case pictures = "pictures"
    }
}
