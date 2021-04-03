//
//  APIEnvironments.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 2/04/21.
//

import Foundation

enum APIEnvironments: String, APIEnvironment {

    case production = "ApiPostsBaseURL"

    var baseUrl: String {
        return (Bundle.main.infoDictionary?[self.rawValue] as? String)?
            .replacingOccurrences(of: "\\", with: "") ?? ""
    }

}
