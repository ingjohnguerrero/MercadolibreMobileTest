//
//  CoordinatorStoryboards.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 14/04/21.
//

import Foundation

/// Storyboards registered in the app
enum CoordinatorStoryboards: String {
    /// Home view
    case main = "Main"
    /// Product details storyboard
    case product = "Product"

    /// File name for the requested storyboard
    var name: String { self.rawValue }
}
