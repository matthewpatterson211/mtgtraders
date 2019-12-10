//
//  DetailViewController.swift
//  MtgTraders
//
//  Created by Matthew Patterson on 12/10/19.
//  Copyright © 2019 Matthew Patterson. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var detailItem: MagicSet?
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = detailItem?.search_uri
        
        if let url = URL(string: urlString!) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
            let decoder = JSONDecoder()
            
    //        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
    //            petitions = jsonPetitions.results
    //            tableView.reloadData()
    //        }
    //        if let jsonCards = try? decoder.decode(Cards.self, from: json) {
    //            cards = jsonCards.data
    //            tableView.reloadData()
    //        }
            
            if let jsonSets = try? decoder.decode(MagicSets.self, from: json) {
//                magicSets = jsonSets.data
//                tableView.reloadData()
            }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
