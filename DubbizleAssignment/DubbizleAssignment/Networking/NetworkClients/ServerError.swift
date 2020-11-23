//
//  ServerError.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
struct ServerError: Decodable {
    let status: String?
    let error: String?
}
