//
//  CartViewController.swift
//  Latte Square
//
//  Created by MacbookAir M1 FoodStory on 7/2/2566 BE.
//

import Foundation
import UIKit

protocol CartDelegate {
    func backToMain(_ menu: [Menu])
}

class CartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var yourCartView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var taxPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var yourCartPriceLabel: UILabel!
    @IBOutlet weak var backButton:UIButton!
    @IBOutlet weak var purchaseButton: UIButton!
    
    var delegate: CartDelegate?
    
    var cartData = [Menu]()
    
    var menuSumPrice: Double = 0
    
    var taxCost: Double = 0
    
    var totalPrice: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        yourCartView.register(UINib(nibName: "CartTableViewCell", bundle: nil),
                              forCellReuseIdentifier: CartTableViewCell.identifier)
        
        calculateMenu()
    }
    
    @IBAction func onbackButtonTapped(){
        delegate?.backToMain(self.cartData)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onpurchaseButtonTapped(_ sender: Any){
        let alert = UIAlertController(title: "Your purchased has been completed", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { [self] (action) in
            delegate?.backToMain(self.cartData)
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func calculateMenu(){
        
            for item in cartData{
                menuSumPrice += Double(item.price * item.quantity)
                taxCost = Double(Int(item.price * 7 / 100))
                totalPrice = menuSumPrice + taxCost
            }
            
            priceLabel.text = String(format: "฿ %0.2f", menuSumPrice)
            taxPriceLabel.text = String(format: "฿ %0.2f", taxCost)
            totalPriceLabel.text = String(format: "฿ %0.2f", totalPrice)
            yourCartPriceLabel.text = String(format: "฿ %0.2f", totalPrice)
        
    }
    
    
    //MARK: - Datasouce & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath)
        as! CartTableViewCell
        
        let menu = cartData[indexPath.row]
        cell.titleLabel.text = menu.title
        cell.quantityLabel.text = "\(menu.quantity)x"
        cell.priceLabel.text = "฿ \(menu.price).00"
        cell.menuImage.image = UIImage(named: menu.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath:
                   IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Remove") { [self] (_, _, completionHandler) in
            
            tableView.beginUpdates()
            cartData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
            menuSumPrice = 0
            taxCost = 0
            totalPrice = 0
            yourCartView.reloadData()
            calculateMenu()
            completionHandler(true)
            
        }
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}
    
