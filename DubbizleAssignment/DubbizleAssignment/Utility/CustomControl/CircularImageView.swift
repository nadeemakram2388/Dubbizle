//
//  CircularImageView.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import UIKit

@IBDesignable class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        clipsToBounds = true
    }
}
