//
//  AlamofireItemService.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

class AlamofireItemService: AlamofireService, ItemsService {

    convenience init() {
        let context = NonPersistentContext(environment: APIEnvironments.production)
        self.init(context: context)
    }

    func items(byTerm term: String, completion: @escaping ([Item], Error?) -> Void) {
        let params = ["q": term]
        get(at: ItemsServiceRouter.searchItemsByTerm, params: params).responseDecodable(of: SearchResultDTO.self) { (response) in
            guard let searchResultsDTO = response.value else {
                completion([], response.error)
                return
            }
            completion(searchResultsDTO.results, nil)
        }
    }
}
