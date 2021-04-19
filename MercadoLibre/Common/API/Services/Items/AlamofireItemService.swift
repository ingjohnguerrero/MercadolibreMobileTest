//
//  AlamofireItemService.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

final class AlamofireItemService: AlamofireService {

    var searchTerm: String?
    var offset: UInt = 0
    var limit: UInt = Contants.itemsPerPage
    var translator: ItemDTOConvetible?

    convenience init(translator: ItemDTOConvetible) {
        let context = NonPersistentContext(environment: APIEnvironments.production)
        self.init(context: context)
        self.translator = translator
    }

    convenience init() {
        let context = NonPersistentContext(environment: APIEnvironments.production)
        self.init(context: context)
        self.translator = ProductTranslator()
    }

}

extension AlamofireItemService: ItemsService {

    func cancelAllRequest() {
        super.cancelAllRequests()
    }

    func items(byTerm term: String, completion: @escaping ([Product], Error?) -> Void) {

        if searchTerm != term {
            offset = 0
            searchTerm = term
        }

        let params: [String : Any] = ["q": term, "offset": offset, "limit": limit]
        get(at: ItemsServiceRouter.searchItemsByTerm, params: params)
            .responseDecodable(of: SearchResultDTO.self) { [weak self] (response) in
            guard let strongSelf = self, let searchResultsDTO = response.value else {
                completion([], response.error)
                return
            }

            let resultItems = searchResultsDTO.results

            guard let productTranslator = strongSelf.translator else {
                return completion([], ItemServiceErrors.productTranslatorNotFound)
            }
            let translatedProducts = resultItems.map({ productTranslator.translate(from: $0) })
            completion(translatedProducts, nil)
        }
    }

    func item(byId itemId: String, completion: @escaping (Product?, Error?) -> Void) {
        let params = ["ids": itemId]

        get(at: ItemsServiceRouter.itemDetails, params: params)
            .responseDecodable(of: [ItemResultDTO].self) { (response) in
            guard let itemDetailsDTO = response.value else {
                return completion(nil, response.error)
            }

            guard let productTranslator = self.translator else {
                return completion(nil, ItemServiceErrors.productTranslatorNotFound)
            }

            if let firstItem = itemDetailsDTO.first?.item {
                let foundProduct = productTranslator.translate(from: firstItem)
                completion(foundProduct, nil)
            } else {
                completion(nil, ItemServiceErrors.itemNotFoundInResults)
            }
        }
    }

    func nextPageItems(offset: UInt, completion: @escaping ([Product], Error?) -> Void) {
        guard let term = searchTerm else {
            return completion([], nil)
        }
        self.offset = offset
        items(byTerm: term, completion: completion)
    }

}
