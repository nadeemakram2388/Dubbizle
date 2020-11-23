//
//  NetworkResponseExtension.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
extension URLResponse {
    var isSuccess: Bool {
        return httpStatusCode >= 200 && httpStatusCode < 300
    }
    
    var httpStatusCode: Int {
        guard let statusCode = (self as? HTTPURLResponse)?.statusCode else {
            return 0
        }
        return statusCode
    }
}
