//
//  ItemListTableViewCell.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemTimeLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemImageView.setCorner(8)
    }
    
    func config(item: Item) {
        let viewModel = ItemViewModel(item: item)
        itemNameLabel.text = viewModel.name
        itemTimeLabel.text = viewModel.postedOn
        if let thumbUrl = viewModel.thumbUrl {
            itemImageView.loadImage(url: thumbUrl, placeHolder: nil) { (image) in
                self.itemImageView.image = image
            }
        }
    }
}
