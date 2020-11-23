//
//  NetworkError.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
typealias NetworkErrorHandler = (NetworkError?) -> Void
struct NetworkError: Error {
    var localizedDescription: String
    init(_ localizedDescription: String) {
        self.localizedDescription = localizedDescription
    }
}
