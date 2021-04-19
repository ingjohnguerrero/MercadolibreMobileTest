//
//  PictureDTO.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 18/04/21.
//

import Foundation

struct PictureDTO: Image {
    var secureUrl: String
}

extension PictureDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case secureUrl = "secure_url"
    }
}
