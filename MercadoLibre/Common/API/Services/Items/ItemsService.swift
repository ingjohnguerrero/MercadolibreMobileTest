//
//  ItemsService.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

/// Service in charge of prividing item data
protocol ItemsService: AnyObject {

    typealias ItemsResponse = (_ items: [Product], _ error: Error?) -> Void
    typealias ItemDetailsResponse = (_ item: Product?, _ error: Error?) -> Void
    
    /// ItemDTO to product translator
    var translator: ItemDTOConvetible? { get set }
    
    /// Request items by given term
    /// - Parameters:
    ///   - term: term to perform product search
    ///   - completion: How to handle the information upon response from server
    func items(byTerm term: String, completion: @escaping ItemsService.ItemsResponse)
    /// Request item by id
    /// - Parameters:
    ///   - itemId: product id
    ///   - completion: Handler for received product or error response
    func item(byId itemId: String, completion: @escaping ItemsService.ItemDetailsResponse)
    /// Request for more product by the given term
    /// - Parameters:
    ///   - offset: Count of already shown results
    ///   - completion: Handler for received products array or error
    func nextPageItems(offset: UInt, completion: @escaping ItemsService.ItemsResponse)
    /// Cancell all the ongoing requests
    func cancelAllRequest()
}
