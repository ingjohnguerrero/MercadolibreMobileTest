//
//  ItemServiceErrors.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

/// Error used by the item service
enum ItemServiceErrors: Error {
    case unableToLoadMock
    case productIdIsEmpty
    case itemNotFoundInResults
    case productTranslatorNotFound
    case simulatedError
}
