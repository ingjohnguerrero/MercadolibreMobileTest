//
//  ItemDTO.swift
//  MercadolibreMobileTest (iOS)
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

/// API product result mapping object
struct ItemDTO: Item {

    /// Product id
    var id: String

    /// Country store id
    var siteId: String

    /// Product title
    var title: String

    /// Product price
    var price: UInt

    /// Product thumbnail url
    var thumbnailUrl: String?

    /// Product pictures
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
