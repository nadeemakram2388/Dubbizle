//
//  NetworkSessionProtocal.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
protocol NetworkSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkDataTaskProtocol
}
