//
//  Product.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 6/04/21.
//

import Foundation

/// Store item
struct Product: Item {
    
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
    var pictures: [Image]?

}
