//
//  Post.swift
//  NetworkLayerRx
//
//  Created by Douglas Hennrich on 19/07/20.
//  Copyright © 2020 Douglas Hennrich. All rights reserved.
//

import Foundation

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}
