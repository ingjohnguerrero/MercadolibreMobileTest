//
//  ProductTranslator.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 7/04/21.
//

import Foundation

protocol ItemDTOConvetible {
    func translate(from itemDTO: ItemDTO) -> Product
}

class ProductTranslator: ItemDTOConvetible {
    func translate(from itemDTO: ItemDTO) -> Product {
        return Product(id: itemDTO.id, siteId: itemDTO.siteId, title: itemDTO.title, price: itemDTO.price)
    }
}
