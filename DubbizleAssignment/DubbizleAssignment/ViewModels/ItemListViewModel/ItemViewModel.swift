//
//  ItemViewModel.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
class ItemViewModel {
    private let item: Item!
    
    let price: String
    let name: String
    let thumbUrl: URL?
    let imgUrl: URL?
    let postedOn: String?

    init(item: Item) {
        self.item = item
        
        price = item.price
        name = item.name
        if let thumbUrlStr = item.image_urls_thumbnails.first {
            thumbUrl = URL(string: thumbUrlStr)
        } else {
            thumbUrl = nil
        }
        if let imgUrlStr = item.image_urls.first {
            imgUrl = URL(string: imgUrlStr)
        } else {
            imgUrl = nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        if let dateAgo = formatter.date(from: item.created_at) {
            postedOn = dateAgo.timeAgoFromToday()
        } else {
            postedOn = nil
        }
    }
}
