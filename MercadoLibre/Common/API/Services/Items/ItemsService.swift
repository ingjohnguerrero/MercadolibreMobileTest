//
//  ItemsService.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

protocol ItemsService {

    typealias ItemsResponse = (_ items: [Item], _ error: Error?) -> Void

    func items(byTerm term: String, completion: @escaping ItemsService.ItemsResponse)
    func nextPageItems(completion: @escaping ItemsService.ItemsResponse)
}
