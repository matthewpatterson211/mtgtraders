//
//  DetailViewController.swift
//  MtgTraders
//
//  Created by Matthew Patterson on 12/10/19.
//  Copyright © 2019 Matthew Patterson. All rights reserved.
//

import UIKit



class DetailViewController: UITableViewController {
    
    var cardDetails = [String]()
    var selectedCard: String = ""
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DetailCell")
        
        print("details")
        
        print(selectedCard)
        
        if let url = URL(string: selectedCard)
        {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        var priceString = ""
        
        
        
        if let jsonCard = try? decoder.decode(Card.self, from: json) {
            print(jsonCard.prices)
            
            cardDetails.append(jsonCard.name)
//            print(jsonCard.mana_cost)
//            if  let manaCost = jsonCard.mana_cost {
//                cardDetails.append(manaCost)
//                print(jsonCard.mana_cost)
//            }
            
            if jsonCard.mana_cost?.isEmpty ?? false {
                cardDetails.append(jsonCard.mana_cost!)
            }



            
            
            cardDetails.append(jsonCard.type_line)
            
//            if (jsonCard.power != nil) {
//                
//                let powerAndToughness: String! = "\(jsonCard.power ?? "0")/\(jsonCard.toughness ?? "0")"
//                print(powerAndToughness ?? "0/0")
//                cardDetails.append(powerAndToughness)
//            }
            
            if let usd = jsonCard.prices["usd"] as? String {
                priceString.append("Usd: $\(usd) ")
            }
            if let foilUsd = jsonCard.prices["usd_foil"] as? String {
                priceString.append("Foil Usd: $\(foilUsd) ")
            }
            if let eur = jsonCard.prices["eur"] as? String {
                priceString.append("Europe: \(eur) ")
            }
            if let tickets = jsonCard.prices["tix"] as? String {
                priceString.append("Tickets: \(tickets) ")
            }
            
            let noNils = jsonCard.prices.filter { $0.value != nil }
            
            if noNils == [:] {
                priceString = "No pricing Data"
            }
            
            cardDetails.append(priceString)
            
            cardDetails.append(jsonCard.set_name)
            
            cardDetails.append(jsonCard.uri)
            
            
            
            print(priceString)
            cardDetails = [jsonCard.name, (jsonCard.mana_cost ?? "0"), jsonCard.type_line, priceString, jsonCard.set_name, jsonCard.uri]
            
                tableView.reloadData()
        }
    }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


            return cardDetails.count
        }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
            

 
            let detail = cardDetails[indexPath.row]

            cell.textLabel?.text = detail


            
            return cell
        }
        

        
}
