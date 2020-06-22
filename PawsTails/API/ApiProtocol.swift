//
//  ApiProtocol.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 4/25/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import Foundation


extension Manager: ApiManagerProtocol {
    func apiRequest(endpoint: Endpoint, parameters: [String : AnyObject]? = nil, headers: [String : String]? = nil) -> ApiRequestProtocol {
        // Insert your common headers here, for example, authorization token or accept.
        var commonHeaders = ["Accept" : "application/json"]
        if let headers = headers {
            commonHeaders += headers
        }
        
        return request(endpoint.method, endpoint.url, parameters: parameters, headers: commonHeaders)
    }
}
