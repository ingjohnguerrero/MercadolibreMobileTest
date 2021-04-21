//
//  JsonHelper.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 6/04/21.
//

import Foundation

/// Json loader helper in charge of loading the mocked information
struct JsonHelper {
    
    /// Json available options
    enum JsonType: String {
        case itemsResult
        case searchResult
    }
    
    /// Request json data depending on the json type
    /// - Parameter jsonType: json type we want to load
    /// - Returns: Data from requested json type
    static func data(from jsonType: JsonType) -> Data? {
        if let url = Bundle.main.url(forResource: jsonType.rawValue, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("error:\(error)")
                return nil
            }
        }
        return nil
    }
}
