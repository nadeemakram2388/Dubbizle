//
//  MockRequest.swift
//  DubbizleAssignmentTests
//
//  Created by nadeem akram on 11/23/20.
//

import Foundation
@testable import DubbizleAssignment

typealias Completion = (Data?, URLResponse?, Error?) -> Void

enum MockRequest {
    case items
}

extension MockRequest {
    //Identify request based on endpoint
    static func identifyRequest(request: URLRequest) -> MockRequest? {
        if request.url?.path == "/default/dynamodb-writer" {
            return items
        }
        return nil
    }
    
    //Return success response
    func completionHandler(request: URLRequest, completion: Completion) {
        guard let method = request.httpMethod, let httpMethod = HTTPMethod(rawValue: method) else {
            fatalError("Unknown HTTPMethod Used.")
        }
        
        switch (self, httpMethod) {
        case (.items, .get):
            getItems(request: request, statusCode: 200, completion: completion)
        default:
            fatalError("Request not handled yet.")
        }
    }
    
    //Return error response
    func badCompletionHandler(request: URLRequest, completion: Completion) {
        guard let method = request.httpMethod, let httpMethod = HTTPMethod(rawValue: method) else {
            fatalError("Unknown HTTPMethod Used.")
        }
        
        switch (self, httpMethod) {
        case (.items, .get):
            getBadItems(request: request, statusCode: 400, completion: completion)
        default:
            fatalError("Request not handled yet.")
        }
    }
    
    // MARK: - Helper Functions
    private func getItems(request: URLRequest, statusCode: Int, completion: Completion) {
        let path = Bundle.init(for: MockNetworkSession.self).path(forResource: "Items", ofType: "json")
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe) else {
            let error = NSError(domain: "No stub data foubt", code: 0, userInfo: nil)
            completion(nil, nil, error)
            return
        }
        
        let response = HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
        completion(data, response, nil)
    }
    
    private func getBadItems(request: URLRequest, statusCode: Int, completion: Completion) {
        let response = HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
        completion(nil, response, NetworkError("Server not reachable."))
    }
    }
