//
//  HomeViewModel.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 8/04/21.
//

import Foundation
import UIKit

class HomeViewModel {
    
    private unowned let view: HomeView
    
    var homeView: HomeView {
        return view
    }
    
    init(view: HomeView) {
        self.view = view
    }
    
}
