//
//  SearchTableTableViewController.swift
//  MtgTraders
//
//  Created by Matthew Patterson on 12/11/19.
//  Copyright © 2019 Matthew Patterson. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)

        let searchPredicate = searchController.searchBar.text!
//        let array = (tableData as NSArray).filtered(using: searchPredicate)
//        filteredTableData = array as! [String]
        
        let completeString = "https://api.scryfall.com/cards/search?q=\(searchPredicate)"
        print(completeString)
        
        if let url = URL(string: completeString) {
        if let data = try? Data(contentsOf: url) {
                parse(json: data)
        }

        self.tableView.reloadData()
    }
    }
    
    var cards = [Card]()
    
    var selectedSet: String = "https://api.scryfall.com/cards?page=1"
    
    let tableData = ["One","Two","Three","Twenty-One"]
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()

        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.obscuresBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()

            tableView.tableHeaderView = controller.searchBar

            return controller
        })()
        
        if let url = URL(string: selectedSet) {
        if let data = try? Data(contentsOf: url) {
                parse(json: data)
        }
        }
        // Reload the table
        tableView.reloadData()
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

            do {
                let jsonCards: Cards = try decoder.decode(Cards.self, from: json)
                cards = jsonCards.data
                
                tableView.reloadData()
            }
            catch {
                print("\(error)")
            }

        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
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
