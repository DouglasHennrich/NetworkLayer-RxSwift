//
//  ApiRouter.swift
//  NetworkLayerRx
//
//  Created by Douglas Hennrich on 19/07/20.
//  Copyright © 2020 Douglas Hennrich. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    //The endpoint name we'll call later
    case getPosts(userId: Int)
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try ServiceConstants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(
            ServiceConstants.ContentType.json.rawValue,
            forHTTPHeaderField: ServiceConstants.HttpHeaderField.acceptType.rawValue)
        
        urlRequest.setValue(
            ServiceConstants.ContentType.json.rawValue,
            forHTTPHeaderField: ServiceConstants.HttpHeaderField.contentType.rawValue)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        switch self {
        case .getPosts:
            return .get
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
        case .getPosts:
            return "posts"
        }
    }
    
    //MARK: - Parameters
    //This is the queries part, it's optional because an endpoint can be without parameters
    private var parameters: Parameters? {
        switch self {
        case .getPosts(let userId):
            //A dictionary of the key (From the ServiceConstants file) and its value is returned
            return [ServiceConstants.Parameters.userId : userId]
        }
    }
}
