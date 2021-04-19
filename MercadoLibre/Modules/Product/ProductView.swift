//
//  ProductView.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 16/04/21.
//

import Foundation

protocol ProductView: AnyObject {
    var productId: String { get set }
    func startLoading()
    func finishLoading()
    func setData(with product: Product)
    func setEmptyView()
    func setErrorView()
}
