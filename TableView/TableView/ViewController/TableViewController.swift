import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var chosenLanguage : Language?
    
    var isSearching : Bool = false
    var searchingResult : [Language] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Languages"
        
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
        
    // Segue baslamadan once kontrolleri ve atamalari gerceklestir.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetailsSegue"){
            let detailVC = segue.destination as! DetailViewController
            detailVC.selectedLanguage = chosenLanguage
        }
    }
}

extension TableViewController : UITableViewDelegate, UITableViewDataSource, TableViewCellProtocol {    
    
    // Table View icerisindeki row sayisini belirt.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return searchingResult.count
        } else {
            return languages.count
        }
    }
    
    // Gosterilecek verileri belirt.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "languagesCell", for: indexPath) as! TableViewCell
        
        if isSearching {
            let item = searchingResult[indexPath.row]
            cell.labelLanguage.text = item.language
            cell.labelDeveloper.text = item.developer
            cell.imageViewLanguage.image = UIImage(named: item.image)
            cell.tableViewCellProtocol = self
            cell.indexPath = indexPath
        } else {
            let item = languages[indexPath.row]
            cell.labelLanguage.text = item.language
            cell.labelDeveloper.text = item.developer
            cell.imageViewLanguage.image = UIImage(named: item.image)
            cell.tableViewCellProtocol = self
            cell.indexPath = indexPath
        }
        return cell
    }
    
    // Table View'da bir Row'a tiklandiginda ilgili verinin detaylarini goruntule.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isSearching {
            // Secilen row verilerini gonderilecek row verilerine ata.
            chosenLanguage = searchingResult[indexPath.row]
            performSegue(withIdentifier: "toDetailsSegue", sender: nil)
        } else {
            // Secilen row verilerini gonderilecek row verilerine ata.
            chosenLanguage = languages[indexPath.row]
            performSegue(withIdentifier: "toDetailsSegue", sender: nil)
        }
    }
    
    // Row sola cekilir ise ilgili elemani sil.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            languages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
        
    func learnAction(indexPath: IndexPath) {
        print("Clicked : \(languages[indexPath.row].language)")
    }
}

extension TableViewController : UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searching = searchController.searchBar.text else { return }
        
        if searching == "" { isSearching = false }
        else {
            isSearching = true
            searchingResult = languages.filter({$0.language.lowercased().contains(searching.lowercased())})
        }
        
        tableView.reloadData()
        
        print(searching)
    }
}
