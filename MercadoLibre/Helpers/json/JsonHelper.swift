//
//  JsonHelper.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 6/04/21.
//

import Foundation

struct JsonHelper {
    enum JsonType: String {
        case itemsResult
        case searchResult
    }

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
