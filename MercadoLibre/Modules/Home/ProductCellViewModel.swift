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
    var thumbnailUrl: String {
        guard let thumbnailUrl = product.thumbnailUrl else {
            return ""
        }

        return thumbnailUrl.replacingOccurrences(of: "http:", with: "https:")
    }

}
