//
//  NetworkApiEndpoint.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation

//Item APIs
enum NetworkAPI {
    case getItems
}

extension NetworkAPI: NetworkRequestProtocol {
    //Set Base URL
    var baseURL: URL {
        guard let url = URL(string: AppConstants.Service.baseURL) else {
            fatalError("BaseURL could not be configured.")
        }
        return url
    }
    
    //Returns EndPoint for Item APIs
    var path: String {
        switch self {
        case .getItems:
            return "default/dynamodb-writer"
        }
    }
    
    //Returns HTTP Method for Item APIs
    var httpMethod: HTTPMethod {
        switch self {
        case .getItems:
            return .get
        }
    }
    
    //Encode and Returns Encoded Data
    var httpBody: Data? {
        return nil
    }
    
    //Return Item APIs Specific Headers
    var headers: HTTPHeaders? {
        return nil
    }
}


