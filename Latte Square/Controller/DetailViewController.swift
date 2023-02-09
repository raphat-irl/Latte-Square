//
//  DetailViewController.swift
//  Latte Square
//
//  Created by MacbookAir M1 FoodStory on 7/2/2566 BE.
//

import Foundation
import UIKit

protocol DetailDelegate {
    
    func onaddToCartButtonTapped(_ menu: Menu, quantity: Int)
}

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

    var delegate: DetailDelegate?
    
    var menu: Menu?
    
    var wantedQuantity: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        
        menuImage.image = UIImage(named: menu?.image ?? "")
        titleLabel.text = menu?.title
        priceLabel.text = "฿ \(String(menu?.price ?? 0))"
        descLabel.text = menu?.desc
        
        
    }
    
    @IBAction func oncloseButtonTapped(_ sender:UIButton){
        backtoMain()
       
    }
    
    func backtoMain(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onaddToCartButtonTapped(_ sender:UIButton){
        
        if let menu = menu {
            var menuToAdd = menu
            menuToAdd.quantity = wantedQuantity
            
            delegate?.onaddToCartButtonTapped(menuToAdd, quantity: wantedQuantity)
            backtoMain()
        }
    }
    
    @IBAction func onincreaseButtonTapped(_ sender:UIButton){
        
        wantedQuantity += 1
        decreaseButton.isEnabled = true
        quantityLabel.text = String(wantedQuantity)
        
    }
    
    @IBAction func ondecreaseButtonTapped(_ sender:UIButton){
        
        if wantedQuantity == 1{
            decreaseButton.isEnabled = false
        } else {
            decreaseButton.isEnabled = true
            wantedQuantity -= 1
        }
        quantityLabel.text = String(wantedQuantity)
    }
}
