//
//  ItemsService.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

protocol ItemsService {

    typealias ItemsResponse = (_ items: [Product], _ error: Error?) -> Void
    typealias ItemDetailsResponse = (_ item: Product?, _ error: Error?) -> Void
    
    var translator: ItemDTOConvetible? { get set }

    func items(byTerm term: String, completion: @escaping ItemsService.ItemsResponse)
    func item(byId itemId: String, completion: @escaping ItemsService.ItemDetailsResponse)
    func nextPageItems(completion: @escaping ItemsService.ItemsResponse)
}
