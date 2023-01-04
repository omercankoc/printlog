import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var chosenLanguage : Language?
    
    var isSearching : Bool = false
    var languageList : [Language] = languages
    
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
        
    // Add event by Seque ID.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetailsSegue"){
            let detailVC = segue.destination as! DetailViewController
            detailVC.selectedLanguage = chosenLanguage
        }
    }
}

extension TableViewController : UITableViewDelegate, UITableViewDataSource, TableViewCellProtocol {    
    
    // Return cell count.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return languageList.count
    }
    
    // Specify cell contents.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "languagesCell", for: indexPath) as! TableViewCell
        
        let item = languageList[indexPath.row]
        cell.labelLanguage.text = item.language
        cell.labelDeveloper.text = item.developer
        cell.imageViewLanguage.image = UIImage(named: item.image)
        cell.tableViewCellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    // Assign the click action to Cell.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLanguage = languageList[indexPath.row]
        performSegue(withIdentifier: "toDetailsSegue", sender: nil)
    }
    
    // Assign swipe action to Cell.
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
        
        if searching == "" {
            isSearching = false
            languageList = languages
        }  else {
            isSearching = true
            languageList = languages.filter({$0.language.lowercased().hasPrefix(searching.lowercased())})
        }
        
        tableView.reloadData()
        
        print(searching)
    }
}
