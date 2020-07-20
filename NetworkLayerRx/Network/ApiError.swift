//
//  ApiError.swift
//  NetworkLayerRx
//
//  Created by Douglas Hennrich on 19/07/20.
//  Copyright © 2020 Douglas Hennrich. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}
