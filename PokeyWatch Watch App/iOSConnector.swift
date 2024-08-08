//
//  iOSConnector.swift
//  PokeyWatch Watch App
//
//  Created by Glny Gl on 07/08/2024.
//

import Foundation
import WatchConnectivity

class iOSConnector: NSObject, WCSessionDelegate {
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
}
