//
//  AppConstants.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation

struct AppConstants {
    
}

enum AppText: String {
    case Items = "Items"
    case SomthingWentWrong = "Somthing went wrong!"

    // Mark- Localized Value
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
