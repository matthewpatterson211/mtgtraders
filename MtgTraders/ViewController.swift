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


class ViewController: UITableViewController {

    var magicSets = [MagicSet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let urlString = "https://api.scryfall.com/sets"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.global().async {
                    self.parse(json: data)
                }
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        


        if let jsonSets = try? decoder.decode(MagicSets.self, from: json) {
            magicSets = jsonSets.data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


        return magicSets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagicSetCell", for: indexPath) as! MagicSetTableViewCell
        

        let magicSet = magicSets[indexPath.row]


        cell.magicSetName?.text = magicSet.name

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ExpansionViewController()
        vc.selectedSet = magicSets[indexPath.row].search_uri
        

        navigationController?.pushViewController(vc, animated: true)
    }
}
