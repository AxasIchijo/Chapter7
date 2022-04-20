//
//  ItemSerchResultSet.swift
//  Chapter7
//
//  Created by AXLT0221-AP on 2022/04/18.
//

import Foundation
import UIKit

struct ItemSearchResultSet: Codable {
    var resultSet: ResultSet
    
    private enum CodingKeys: String, CodingKey {
        case resultSet = "ResultSet"
    }
}

struct ResultSet: Codable {
    var firstObject: FirstObject
    
    private enum CodingKeys: String, CodingKey {
        case firstObject = "0"
    }
}

struct FirstObject: Codable {
    var result: Result
    
    private enum CodingKeys: String, CodingKey {
        case result = "Result"
    }
}

class Result: Codable {
    var items: [ItemData] = [ItemData]()
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyCodingKey.self)
        
        items = container.allKeys
            .sorted { $0.intValue! < $1.intValue! }
            .compactMap { try? container.decode(ItemData.self, forKey: $0) }
    }
    
    func encode(to encoder: Encoder) throws {
        // 実装不要
    }
    
    // private let codingKeys: [MyCodingKey] = (0...20).map { MyCodingKey(intValue: $0)! }
    
    private struct MyCodingKey: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            return nil
        }
        var intValue: Int?
        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = String(intValue)
        }
    }
}

struct ItemData: Codable {
    var name = ""
    var url = ""
    var imageInfo = ImageInfo()
    var priceInfo = PriceInfo()
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case imageInfo = "Image"
        case priceInfo = "Price"
    }
}

struct ImageInfo: Codable {
    var medium: String?
    
    private enum CodingKeys: String, CodingKey {
        case medium = "Medium"
    }
}

struct PriceInfo: Codable {
    var price: String?
    
    private enum CodingKeys: String, CodingKey {
        case price = "_value"
    }
}

