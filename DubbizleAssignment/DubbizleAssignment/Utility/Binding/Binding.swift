//
//  Binding.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation

class Binding<T> {
    typealias EventListener = (T) -> Void
    var listener: EventListener?
    
    var value: T {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: EventListener?) {
        self.listener = listener
        listener?(value)
    }
}
