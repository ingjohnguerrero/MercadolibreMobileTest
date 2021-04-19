//
//  MockItemsService.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

final class MockItemsService: ItemsService {

    var translator: ItemDTOConvetible?
    var itemDetailsJsonData: Data? = JsonHelper.data(from: .itemsResult)
    var jsonSearchResultData: Data? = JsonHelper.data(from: .searchResult)
    var isErrorResponse: Bool = false

    init(translator: ItemDTOConvetible) {
        self.translator = translator
    }

    convenience init() {
        let productTranslator = ProductTranslator()
        self.init(translator: productTranslator)
    }

    func cancelAllRequest() {
        print("Nothing to do")
    }

    func items(byTerm term: String, completion: @escaping ([Product], Error?) -> Void) {
        guard !term.isEmpty else { return completion([], nil) }
        guard !isErrorResponse else { return completion([], ItemServiceErrors.simulatedError)}
        guard let jsonData = JsonHelper.data(from: .searchResult) else { return completion([], ItemServiceErrors.unableToLoadMock) }
        do {
            let itemDTO = try JSONDecoder().decode(SearchResultDTO.self, from: jsonData)
            let products = itemDTO.results.map({ translator!.translate(from: $0) })
            completion(products, nil)
        } catch {
            completion([], error)
        }
    }

    func item(byId itemId: String, completion: @escaping (Product?, Error?) -> Void) {
        guard !itemId.isEmpty else { return completion(nil, ItemServiceErrors.productIdIsEmpty) }
        guard !isErrorResponse else { return completion(nil, ItemServiceErrors.simulatedError)}
        guard let itemDetailsJsonData = JsonHelper.data(from: .itemsResult) else { return completion(nil, ItemServiceErrors.unableToLoadMock) }
        do {
            let itemResultDTO = try JSONDecoder().decode([ItemResultDTO].self, from: itemDetailsJsonData)
            if let firstItem = itemResultDTO.first?.item {
                let foundProduct = translator!.translate(from: firstItem)
                completion(foundProduct, nil)
            } else {
                throw ItemServiceErrors.itemNotFoundInResults
            }
        } catch {
            debugPrint(error)
            completion(nil, error)
        }
    }

    func nextPageItems(offset: UInt, completion: @escaping ([Product], Error?) -> Void) {
        items(byTerm: "", completion: completion)
    }

}
