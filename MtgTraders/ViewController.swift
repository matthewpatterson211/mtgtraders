//
//  ViewController.swift
//  MtgTraders
//
//  Created by Matthew Patterson on 12/9/19.
//  Copyright © 2019 Matthew Patterson. All rights reserved.
//

import UIKit

class MagicSetTableViewCell: UITableViewCell {
    @IBOutlet weak var magicSetSymbol: UIImageView!
    @IBOutlet weak var magicSetName: UILabel!
    
}

class CardTableViewCell: UITableViewCell {
    
}

class ViewController: UITableViewController {
//    var cards = [Card]()
    var magicSets = [MagicSet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let urlString = "https://api.scryfall.com/cards?page=3"
        let urlString = "https://api.scryfall.com/sets"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        

//        if let jsonCards = try? decoder.decode(Cards.self, from: json) {
//            cards = jsonCards.data
//            tableView.reloadData()
//        }
        
        if let jsonSets = try? decoder.decode(MagicSets.self, from: json) {
            magicSets = jsonSets.data
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        return cards.count
        return magicSets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MagicSetTableViewCell
        
//        cell.textLabel?.text = petition.title
//        cell.detailTextLabel?.text = petition.body
//        let card = cards[indexPath.row]
//        cell.textLabel?.text = card.name
//        cell.detailTextLabel?.text = card.set_name
        let magicSet = magicSets[indexPath.row]

//        print(magicSet.icon_svg_uri)
//        if let url = URL(string: magicSet.icon_svg_uri) {
//            print(url)
//             if let data = try? Data(contentsOf: url) {
//                print(data)
//                  cell.magicSetSymbol.image = UIImage(data: data)
//             }
//        }
//        print(magicSet.icon_svg_uri)
//        let image = getImage(from: magicSet.icon_svg_uri)
//        cell.magicSetSymbol.image = image
        cell.magicSetName?.text = magicSet.name
        print(magicSet.icon_svg_uri)
        if let imageURL = URL(string: magicSet.icon_svg_uri) {
            DispatchQueue.global().async {
            
            let imageData = try? Data(contentsOf: imageURL)
                
                if let imageData = imageData {
                    let image = UIImage(data: imageData)

                    DispatchQueue.main.async {
                        cell.magicSetSymbol.image = image
                    }
                }
        }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = magicSets[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
