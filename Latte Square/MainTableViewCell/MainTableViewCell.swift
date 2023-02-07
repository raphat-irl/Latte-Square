//
//  MainTableViewCell.swift
//  Latte Square
//
//  Created by MacbookAir M1 FoodStory on 7/2/2566 BE.
//

import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var menuImage:UIImageView!
    @IBOutlet weak var priceLabel:UILabel!
    
    static let identifier = "MainTableViewCell"
    
    var menu = [Menu]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(menu: Menu){
        
        menuImage.image = UIImage(named: menu.image)
        titleLabel.text = menu.title
        priceLabel.text = "฿ \(String(menu.price))"
        
    }
    
    
    
}
