//
//  MainViewController.swift
//  Latte Square
//
//  Created by MacbookAir M1 FoodStory on 7/2/2566 BE.
//

import Foundation
import UIKit

class MainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var menuView: UITableView!
    @IBOutlet weak var summaryView: UIView!
    @IBOutlet weak var yourCartButton: UIButton!
    @IBOutlet weak var yourCartPriceLabel: UILabel!
    
    var menuSumsPrice: Int = 0
    
    var dataMenuArray = [Menu]()
    
    let dataList: [Menu] = [
        Menu(title: "Black coffee",
             desc: "Black coffee is as simple as it gets with ground coffee beans steeped in hot water, served warm. And if you want to sound fancy, you can call black coffee by its proper name: cafe noir.",
             price: 55,
             image: "blackcoffee",
             quantity: 1),
        Menu(title: "Latte",
             desc: "As the most popular coffee drink out there, the latte is comprised of a shot of espresso and steamed milk with just a touch of foam. It can be ordered plain or with a flavor shot of anything from vanilla to pumpkin spice.",
             price: 66,
             image: "latte",
             quantity: 1),
        Menu(title: "Cappuccino",
             desc: "Cappuccino is a latte made with more foam than steamed milk, often with a sprinkle of cocoa powder or cinnamon on top. Sometimes you can find variations that use cream instead of milk or ones that throw in flavor shot, as well.",
             price: 60,
             image: "cappuccino",
             quantity: 1),
        Menu(title: "Americano",
             desc: "With a similar flavor to black coffee, the americano consists of an espresso shot diluted in hot water.",
             price: 60,
             image: "americano",
             quantity: 1),
        Menu(title: "Espresso",
             desc: "An espresso shot can be served solo or used as the foundation of most coffee drinks, like lattes and macchiatos.",
             price: 55,
             image: "espresso",
             quantity: 1),
        Menu(title: "Doppio",
             desc: "A double shot of espresso, the doppio is perfect for putting extra pep in your step.",
             price: 65,
             image: "doppio",
             quantity: 1),
        Menu(title: "Cortado",
             desc:"Like yin and yang, a cortado is the perfect balance of espresso and warm steamed milk. The milk is used to cut back on the espresso’s acidity.",
             price: 65,
             image: "cortado",
             quantity: 1),
        Menu(title: "Red Eye",
             desc: "Named after those pesky midnight flights, a red eye can cure any tiresome morning. A full cup of hot coffee with an espresso shot mixed in, this will definitely get your heart racing.",
             price: 60,
             image: "redeye",
             quantity: 1),
        Menu(title: "Lungo",
             desc:  "A lungo is a long-pull espresso. The longer the pull, the more caffeine there is and the more ounces you can enjoy.",
             price: 65,
             image: "lungo",
             quantity: 1),
        Menu(title: "Macchiato",
             desc: "The macchiato is another espresso-based drink that has a small amount of foam on top. It’s the happy medium between a cappuccino and a doppio.",
             price: 70,
             image: "macchiato",
             quantity: 1),
        Menu(title: "Mocha", desc: "For all you chocolate lovers out there, you’ll fall in love with a mocha (or maybe you already have). The mocha is a chocolate espresso drink with steamed milk and foam.",
             price: 70,
             image: "mocha",
             quantity: 1),
        Menu(title: "Ristretto",
             desc: "Ristretto is an espresso shot. It uses less hot water which creates a sweeter flavor compared to the bitter taste of a traditional shot of espresso or a doppio.",
             price: 60,
             image: "ristretto",
             quantity: 1),
        Menu(title: "Flat White",
             desc: "This Aussie-born drink is basically a cappuccino without the foam or chocolate sprinkle. It’s an espresso drink with steamed milk.",
             price: 70,
             image: "flatwhite",
             quantity: 1),
        Menu(title: "Affogato",
             desc: "The affogato is an excuse to enjoy a scoop of ice cream any time of day (and any time of year in my opinion). Served with a scoop of ice cream and a shot of espresso, or two.",
             price: 70,
             image: "affogato",
             quantity: 1)
    ]
    
    func setUpView(){
        menuView.register(UINib(nibName: MainTableViewCell.identifier, bundle: nil),forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    //MARK: - DataSouce & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier,
            for: indexPath as IndexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        let data = dataList[indexPath.row]
        cell.setCell(menu: data)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            destinationVC.menu = data
            destinationVC.delegate = self
            
            self.navigationController?.present(destinationVC, animated: true)
        }
    }
    
    func calculate(){
        
        menuSumsPrice = 0
        for item in dataMenuArray{
            
            menuSumsPrice += item.price * item.quantity
        }
        
        yourCartPriceLabel.text = "฿ \(menuSumsPrice)"
        
    }
    
    
    @IBAction func onsummaryButtonTapped(){
        moveToCartView()
    }
    
    func moveToCartView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "CartViewController")
        as! CartViewController
        destinationVC.cartData = dataMenuArray
        destinationVC.delegate = self
        self.navigationController?.present(destinationVC, animated: true )
    }
    
}

extension MainViewController:DetailDelegate{
    
    func onaddToCartButtonTapped(_ menu: Menu, quantity: Int) {
        
        summaryView.isHidden = false
        
        yourCartPriceLabel.text = "฿\(String(menuSumsPrice))"
        if let index = dataMenuArray.firstIndex(where: {$0.title == menu.title}) {
            dataMenuArray[index].quantity += menu.quantity
        } else {
            dataMenuArray.append(menu)
        }
        calculate()
        menuView.reloadData()
        
    }
}

extension MainViewController:CartDelegate{
    
    func backToMain(_ menu: [Menu]) {
        
        var menuSumPrice: Int = 0
        dataMenuArray = menu
        if dataMenuArray.count == 0{
            summaryView.isHidden = true
            yourCartPriceLabel.text = ""
        } else {
            summaryView.isHidden = false
            for item in dataMenuArray{
                menuSumPrice += item.price * item.quantity
                yourCartPriceLabel.text = "฿\(String(format: "%d", menuSumPrice)).00 "
            }
        }
        menuView.reloadData()
    }
    
    
}
