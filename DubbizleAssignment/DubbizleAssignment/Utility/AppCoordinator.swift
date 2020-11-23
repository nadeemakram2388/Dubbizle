//
//  AppCoordinator.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
import UIKit

class AppCoordinator {
    
    class func toItemDetail(_ item: Item, navC: UINavigationController?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: ItemDetailViewController.name, creator: { coder in
            return ItemDetailViewController(coder: coder, item: item)
        })
        navC?.pushViewController(vc, animated: true)
    }
}
