//
//  BadMockNetworkSession.swift
//  DubbizleAssignmentTests
//
//  Created by nadeem akram on 11/23/20.
//

import Foundation

@testable import DubbizleAssignment

//BadMockSession will always return error or nil response
class BadMockNetworkSession: NetworkSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkDataTaskProtocol {
        
        if let mockRequest =  MockRequest.identifyRequest(request: request) {
            mockRequest.badCompletionHandler(request: request, completion: completionHandler)
        }
        
        return MockNetworkDataTask()
    }
}
