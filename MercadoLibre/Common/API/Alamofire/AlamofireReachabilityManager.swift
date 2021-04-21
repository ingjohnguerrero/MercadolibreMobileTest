//
//  AlamofireReachabilityManager.swift
//  MercadoLibre
//
//  Created by John Edwin Guerrero Ayala on 20/04/21.
//

import Foundation
import Alamofire

class AlamofireReachabilityManager {

    var reachabilityManager: NetworkReachabilityManager!
    var onReachableClosure: (() -> Void)?
    var onNotReachableClosure: (() -> Void)?

    init() {
        reachabilityManager = NetworkReachabilityManager(host: "www.google.com")
        startNetworkMonitoring()
    }

    func startNetworkMonitoring() {
        reachabilityManager?.startListening { [weak self] status in
            DispatchQueue.main.async {
                switch status {
                case .notReachable:
                    self?.onNotReachableClosure?()
                case .reachable(.cellular), .reachable(.ethernetOrWiFi):
                    self?.onReachableClosure?()
                case .unknown:
                    print("Unknown network state")
                }
            }
        }
    }

    func setStatusListeners(
        onReachableClosure: (() -> Void)?,
        onNotReachableClosure: (() -> Void)?
    ) {
        self.onReachableClosure = onReachableClosure
        self.onNotReachableClosure = onNotReachableClosure
    }

    deinit {
        reachabilityManager.stopListening()
    }
}
