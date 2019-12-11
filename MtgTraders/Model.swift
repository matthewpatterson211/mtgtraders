//
//  Model.swift
//  MtgTraders
//
//  Created by Matthew Patterson on 12/11/19.
//  Copyright © 2019 Matthew Patterson. All rights reserved.
//

import Foundation



class model {
    
    var cards = [Card]()
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        do {
            let jsonCards: Cards = try decoder.decode(Cards.self, from: json)
            cards = jsonCards.data
            
//            tableView.reloadData()
        }
        catch {
            print("\(error)")
        }

    }
}
