//
//  Item.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
struct Item: Decodable {
    var created_at: String
    var price: String
    var name: String
    var uid: String
    var image_ids: [String]
    var image_urls: [String]
    var image_urls_thumbnails: [String]
}

struct ItemData: Decodable {
    var results: [Item]
}
