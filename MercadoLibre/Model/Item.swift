//
//  Item.swift
//  MercadolibreMobileTest (iOS)
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

/// Store item interface
protocol Item {
    associatedtype Picture
    /// Product id
    var id: String { get set }
    /// Country store id
    var siteId: String { get set }
    /// Product title
    var title: String { get set }
    /// Product price
    var price: UInt { get set }
    /// Product thumbnail
    var thumbnailUrl: String? { get set }
    /// Product pictures
    var pictures: [Picture]? { get set }
}
