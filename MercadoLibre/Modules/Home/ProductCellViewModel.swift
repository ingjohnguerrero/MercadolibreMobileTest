//
//  ProductCellViewModel.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 9/04/21.
//

import Foundation

struct ProductCellViewModel: CellViewModel {
    
    var product: Product
    var title: String { return product.title}
    
}
