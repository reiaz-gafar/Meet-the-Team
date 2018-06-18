//
//  Member.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import Foundation

struct Member: Codable {
    let id: String
    let name: String
    let position: String
    let profile_image: String
    let personality: String
    let interests: String
    let dating_preferences: String
}
