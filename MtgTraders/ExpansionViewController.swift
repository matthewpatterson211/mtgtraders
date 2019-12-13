//
//  ExpansionViewController.swift
//  MtgTraders
//
//  Created by Matthew Patterson on 12/10/19.
//  Copyright © 2019 Matthew Patterson. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
}

class ExpansionViewController: UITableViewController {
    
    var cards = [Card]()
    
    var selectedSet: String = "https://api.scryfall.com/cards?page=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CardCell.self, forCellReuseIdentifier: "Cell")

        
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: self.selectedSet) {
        if let data = try? Data(contentsOf: url) {
            self.parse(json: data)
        }
    }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        do {
            let jsonCards: Cards = try decoder.decode(Cards.self, from: json)
            cards = jsonCards.data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print("\(error)")
        }

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CardCell
        
        let card = cards[indexPath.row]
        
        cell.textLabel?.text = card.name
        
        
//        cell.price?.text = card.set_name
//        cell.title?.text = card.name
//        cell.Subtitle?.text = card.set_name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.selectedCard = cards[indexPath.row].uri
        

        navigationController?.pushViewController(vc, animated: true)
    }
}
