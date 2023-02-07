//
//  DetailViewController.swift
//  Latte Square
//
//  Created by MacbookAir M1 FoodStory on 7/2/2566 BE.
//

import Foundation
import UIKit

class DetailViewController: ViewController{
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    weak var viewcontroller: DetailViewController?
    
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        
        menuImage.image = UIImage(named: menu?.image ?? "")
        titleLabel.text = menu?.title
        priceLabel.text = "฿ \(String(menu?.price ?? 0))"
        descLabel.text = menu?.desc
        quantityLabel.text = "10"
        
    }
    
    @IBAction func oncloseButtonTapped(_ sender:UIButton){
        backtoMain()
    }
    
    func backtoMain(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onaddToCartButtonTapped(_ sender:UIButton){
        
    }
    
    @IBAction func onincreaseButtonTapped(_ sender:UIButton){
        
    }
    
    @IBAction func ondecreaseButtonTapped(_ sender:UIButton){
        
    }
    
    
}
