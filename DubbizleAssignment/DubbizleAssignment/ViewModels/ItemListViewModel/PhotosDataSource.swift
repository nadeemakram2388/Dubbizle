//
//  ItemDetailViewModel.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/23/20.
//

import Foundation

struct PhotosDataSource {
    public private(set) var photos: [String] = []
    
    var numberOfPhotos: Int {
        return photos.count
    }
    
    func photoAtIndex(_ index: Int) -> String? {
        if (index < photos.count && index >= 0) {
            return photos[index];
        }
        return nil
    }
    
    func indexOfPhoto(_ photo: String) -> Int? {
        return photos.firstIndex(where: { $0 == photo})
    }
    
    func contaPhoto(_ photo: String) -> Bool {
        return indexOfPhoto(photo) != nil
    }
        
    public subscript(index: Int) -> String? {
        get {
            return photoAtIndex(index)
        }
    }
}
