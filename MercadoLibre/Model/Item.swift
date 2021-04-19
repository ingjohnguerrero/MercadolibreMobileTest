//
//  Item.swift
//  MercadolibreMobileTest (iOS)
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

protocol Item {
    associatedtype Picture
    var id: String { get set }
    var siteId: String { get set }
    var title: String { get set }
    var price: UInt { get set }
    var thumbnailUrl: String? { get set }
    var pictures: [Picture]? { get set }
}
