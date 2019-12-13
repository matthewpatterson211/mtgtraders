//
//  TradeViewController.swift
//  MtgTraders
//
//  Created by Matthew Patterson on 12/12/19.
//  Copyright © 2019 Matthew Patterson. All rights reserved.
//

import UIKit

var topCardArray: [Card] = []
var bottomCardArray: [Card] = []

var tableView: UITableView  =   UITableView()

class TradeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath)
        cell.textLabel?.text = "nil"
        return cell
    }
    
    
    var topCardAdder = false
    var bottomCardAdder = false
    
    

    
    var topSelectedCard: String = ""

    @IBOutlet weak var priceDifference: UILabel!
    

//    @IBOutlet weak var topTableView: UITableView!
//    @IBOutlet weak var bottomTableView: UITableView!
    
    @IBAction func addToTop(_ sender: Any) {
        let vc = SearchTableViewController()
        vc.topCardAdder = true
//        vc.bottomCardAdder = false
        

//        navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func addToButtom(_ sender: Any) {
        bottomCardAdder = true
        topCardAdder = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(topSelectedCard)
        
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.init(frame: 50)
        self.tableView.reloadData()
        
        
//        topTableView.delegate = self
//        topTableView.dataSource = self

//        self.topTableView.reloadData()

//        bottomTableView.delegate = self
//        bottomTableView.dataSource = self
        
        
        
        
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "topAdderNav" {
             let vc = segue.destination as! SearchTableViewController
            vc.topCardAdder = true
            vc.delegate = self
        }
    }
    
    func receiveCard(cardToAdd: Card) {
//        print(cardToAdd)
//        print(cardToAdd.prices["usd"])
//        print(cardToAdd.printPricing)
//        topCardArray.append(cardToAdd)
//        topCardArray.append(cardToAdd)
        print(topCardArray)
        self.tableView.reloadData()
        
//        topTableView.reloadData()
//        bottomTableView.reloadData()
        
    }
    
    }

//extension TradeViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var count:Int?
//        
////        if tableView == self.topTableView {
////            count = topCardArray.count
////        }
////        
////        if tableView == self.bottomTableView {
////            count =  bottomCardArray.count
////        }
//        
//        return count!
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        var cell: CardPriceCell?
//        
//        if tableView == self.topTableView {
//            cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as? CardPriceCell
//            let previewDetail = topCardArray[indexPath.row]
//            cell?.setCell(card: previewDetail)
//            
//        }
//        
//        if tableView == self.bottomTableView {
//            cell = tableView.dequeueReusableCell(withIdentifier: "BottomCell", for: indexPath) as? CardPriceCell
//            let previewDetail = bottomCardArray[indexPath.row]
//            cell?.setCell(card: previewDetail)
//            
//        }
//        return cell!
//
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("did select:      \(indexPath.row)  ")
//    }
//    
//    
//}
