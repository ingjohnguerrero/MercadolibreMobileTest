//
//  ProductTranslator.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 7/04/21.
//

import Foundation

/// Item DTO translator protocol
protocol ItemDTOConvetible {
    func translate(from itemDTO: ItemDTO) -> Product
}

/// Item DTO to Product implementation
class ProductTranslator: ItemDTOConvetible {
    func translate(from itemDTO: ItemDTO) -> Product {
        var product = Product(
            id: itemDTO.id,
            siteId: itemDTO.siteId,
            title: itemDTO.title,
            price: itemDTO.price,
            thumbnailUrl: itemDTO.thumbnailUrl
        )

        guard let productPictures = itemDTO.pictures else {
            product.pictures = []
            return product
        }
        product.pictures = productPictures.map({ (productImage) -> Picture in
            Picture(secureUrl: productImage.secureUrl)
        })
        return product
    }
}
