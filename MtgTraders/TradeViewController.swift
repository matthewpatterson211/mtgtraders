//
//  TradeViewController.swift
//  MtgTraders
//
//  Created by Matthew Patterson on 12/12/19.
//  Copyright © 2019 Matthew Patterson. All rights reserved.
//

import UIKit

class TradeViewController: UIViewController {
    
    var topCardAdder = false
    var bottomCardAdder = false
    
    var topSelectedCard: String = ""

    @IBOutlet weak var priceDifference: UILabel!
    
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

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "topAdderNav" {
             let vc = segue.destination as! SearchTableViewController
            vc.topCardAdder = true
            vc.delegate = self
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
