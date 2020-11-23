//
//  MockNetworkSession.swift
//  DubbizleAssignmentTests
//
//  Created by nadeem akram on 11/23/20.
//

import Foundation

@testable import DubbizleAssignment

//MokeSession or Good MockSession always return success response
class MockNetworkSession: NetworkSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkDataTaskProtocol {
        if let mockRequest =  MockRequest.identifyRequest(request: request) {
            mockRequest.completionHandler(request: request, completion: completionHandler)
        }
        
        return MockNetworkDataTask()
    }
}
