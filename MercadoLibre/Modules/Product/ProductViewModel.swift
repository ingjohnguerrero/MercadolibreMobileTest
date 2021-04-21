//
//  ProductViewModel.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 16/04/21.
//

import Foundation

/// View model for the product details view
final class ProductViewModel {

    // MARK: - Public properties -

    /// bind to the view product id
    var productId: String {
        return productView.productId
    }

    /// Product view reference
    var productView: ProductView {
        return view
    }

    /// Current state for the view model
    var currentState: ProductViewState {
        get {
            return state
        }
        set {
            state = newValue
        }
    }

    /// View model data source
    var productService: ItemsService {
        return service
    }

    // MARK: - Private properties -

    /// Product view reference
    private unowned var view: ProductView
    /// Item service instance
    fileprivate var service: ItemsService!
    /// Current state and initial state
    fileprivate var state: ProductViewState = ProductStandByState()

    /// View model initializer
    /// - Parameters:
    ///   - view: product view instance to be managed
    ///   - service: data source service for the view model
    init(view: ProductView, service: ItemsService) {
        self.view = view
        self.service = service
    }

    /// Alternative initializer for the view model with default item service
    /// - Parameter view: product view to be managed
    convenience init(view: ProductView) {
        let alamofireService = AlamofireItemService()
        self.init(view: view, service: alamofireService)
    }

}

extension ProductViewModel {
    /// First method to start loading information for the view
    func loadProductById() {
        state = ProductLoadState(context: self)
        state.load()
    }
}
