//
//  UITableViewExtension.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
import UIKit

extension UITableView {
    
    // Register nib on UITableView...
    func register(nib nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: nibName)
    }
}
