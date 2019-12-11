//
//  Card.swift
//  MtgTraders
//
//  Created by Matthew Patterson on 12/9/19.
//  Copyright © 2019 Matthew Patterson. All rights reserved.
//

import Foundation

struct Card: Codable {
    var name: String
    var set_name: String
    var mana_cost: String?
    var uri: String
    var prices: [String: String?]
    var type_line: String
    var power: String?
    var toughness: String?
}
