import UIKit

class MagicCardTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var set: UILabel!
    @IBOutlet weak var price: UILabel!
    
}

class SetViewController: UITableViewController {
    var cards = [Card]()
    var selectedSet: String = "https://api.scryfall.com/cards?page=1"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(MagicCardTableViewCell.self, forCellReuseIdentifier: "Cell")
        

//        let urlString = "https://api.scryfall.com/cards?page=3"
        let urlString = selectedSet
        
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
        
        if let jsonCards = try? decoder.decode(Cards.self, from: json) {
            cards = jsonCards.data
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return cards.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MagicCardTableViewCell
        
        let card = cards[indexPath.row]

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
        print(card.name)
        
        cell.name?.text = card.name
        print(cell.name?.text)
        cell.set?.text = card.set_name
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailViewController()
//        vc.detailItem = magicSets[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
//    }
//}
}
