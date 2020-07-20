//
//  ServiceConstants.swift
//  NetworkLayerRx
//
//  Created by Douglas Hennrich on 19/07/20.
//  Copyright © 2020 Douglas Hennrich. All rights reserved.
//

import Foundation


struct ServiceConstants {
    
    //The API's base URL
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let userId = "userId"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}
