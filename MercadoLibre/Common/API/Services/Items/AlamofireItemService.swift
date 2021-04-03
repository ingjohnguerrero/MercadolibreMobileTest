//
//  AlamofireItemService.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

final class AlamofireItemService: AlamofireService {
    
    var cachedItems: [Item] = []
    var searchTerm: String?
    var offset: UInt = 0
    var limit: UInt = Contants.itemsPerPage
    
    convenience init() {
        let context = NonPersistentContext(environment: APIEnvironments.production)
        self.init(context: context)
    }
    
}

extension AlamofireItemService: ItemsService {
    func items(byTerm term: String, completion: @escaping ([Item], Error?) -> Void) {
        
        if searchTerm != term {
            cachedItems = []
            searchTerm = term
        }
        
        let params: [String : Any] = ["q": term, "offset": offset, "limit": limit]
        get(at: ItemsServiceRouter.searchItemsByTerm, params: params).responseDecodable(of: SearchResultDTO.self) { (response) in
            guard let searchResultsDTO = response.value else {
                completion([], response.error)
                return
            }
            
            let resultItems = searchResultsDTO.results
            self.cachedItems += Array(resultItems)
            completion(resultItems, nil)
        }
    }
    
    func nextPageItems(completion: @escaping ([Item], Error?) -> Void) {
        guard let term = searchTerm else {
            return completion([], nil)
        }
        self.offset = UInt(cachedItems.count)
        items(byTerm: term, completion: completion)
    }
}

