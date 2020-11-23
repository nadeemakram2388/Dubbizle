//
//  NSObjectExtension.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
extension NSObject {
    class var name: String {
        return String(describing: self)
    }
}
