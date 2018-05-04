//
//  BitfinexWSResponseConstructor.swift
//  BitfinexRealTime
//
//  Created by Ferdinando Messina on 04.05.18.
//  Copyright © 2018 Ferdinando Messina. All rights reserved.
//

import UIKit

class BitfinexWSResponseConstructor: NSObject {
    
    /// This method will parse a websocket string response and return the proper response object
    ///
    /// - Parameters:
    ///   - jsonString: The response string received on the web socket
    ///
    static func websocketMessage(fromJsonString jsonString: String) -> BitfinexWebsocketMessage? {
        
        guard let jsonObject = jsonString.parseAsJSON() else {
            return nil
        }
        
        // EVENT Response
        if let jsonEventMessage = jsonObject as? EventMessage {
            if let jsonEvent = jsonEventMessage["event"] as? String {
                switch jsonEvent {
                case "info":
                    // Return Info Event
                    print("INFO EVENT")
                    return BitfinexWebsocketInfoMessage(withJson: jsonEventMessage)
                case "pong":
                    // Return Pong Event
                    print("PONG EVENT")
                case "subscribed":
                    // Return Subscribe Event
                    print("SUBSCRIBE EVENT")
                case "unsubscribed":
                    // Return Unsubscribe Event
                    print("UNSUBSCRIBE EVENT")
                case "error":
                    // Return Error Event
                    print("ERROR EVENT")
                default:
                    print("ERROR EVENT")
                }
            }
        }
        
        return nil
    }
}