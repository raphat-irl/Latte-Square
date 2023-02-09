//
//  CartViewController.swift
//  Latte Square
//
//  Created by MacbookAir M1 FoodStory on 7/2/2566 BE.
//

import Foundation
import UIKit

class CartViewController: UIViewController/*,UITableViewDataSource,UITableViewDelegate*/{
    
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var yourCartView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var taxPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var menuSumPrice: Double = 0
    
    var cartMenuArray: [Menu]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    //MARK: - Datasouce & Delegate
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
}
