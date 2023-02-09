//
//  CartTableViewCell.swift
//  Latte Square
//
//  Created by MacbookAir M1 FoodStory on 7/2/2566 BE.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let identifier = "CartTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
