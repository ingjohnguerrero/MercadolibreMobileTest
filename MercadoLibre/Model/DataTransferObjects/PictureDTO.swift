//
//  PictureDTO.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 18/04/21.
//

import Foundation

/// API picture mapping object
struct PictureDTO: Image {
    /// Picture https url
    var secureUrl: String
}

extension PictureDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case secureUrl = "secure_url"
    }
}
