//
//  ProductViewModel.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 16/04/21.
//

import Foundation

final class ProductViewModel {

    // MARK: - Public properties -

    var productId: String {
        return productView.productId
    }

    var productView: ProductView {
        return view
    }

    var currentState: ProductViewState {
        get {
            return state
        }
        set {
            state = newValue
        }
    }

    var productService: ItemsService {
        return service
    }

    // MARK: - Private properties -

    private unowned var view: ProductView
    fileprivate var service: ItemsService!
    var state: ProductViewState = ProductStandByState()

    init(view: ProductView, service: ItemsService) {
        self.view = view
        self.service = service
    }

    convenience init(view: ProductView) {
        let alamofireService = AlamofireItemService()
        self.init(view: view, service: alamofireService)
    }

}

extension ProductViewModel {
    func loadProductById() {
        state = ProductLoadState(context: self)
        state.load()
    }
}
