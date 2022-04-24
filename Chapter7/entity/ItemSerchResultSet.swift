//
//  ItemSerchResultSet.swift
//  Chapter7
//
//  Created by AXLT0221-AP on 2022/04/18.
//

import Foundation
import UIKit

struct ItemSearchResultSet: Codable {
    var resultSet: [ItemData]
    
    private enum CodingKeys: String, CodingKey {
        case resultSet = "hits"
    }
}

struct ItemData: Codable {
    var name = ""
    var url = ""
    var imageInfo = ImageInfo()
    var price = 0
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
        case imageInfo = "image"
        case price
    }
}

struct ImageInfo: Codable {
    var medium: String?
    
    private enum CodingKeys: String, CodingKey {
        case medium
    }
}
