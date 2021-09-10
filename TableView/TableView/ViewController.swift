import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var languageArray = [Language]()
    var chosenLanguage : Language?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let kotlin = Language(initLanguage: "Kotlin", initImage: UIImage(named: "kotlin")!, initDeveloper: "JetBrains", initYear: "2011")
        let swift = Language(initLanguage: "Swift", initImage: UIImage(named: "swift")!, initDeveloper: "Apple", initYear: "2014")
        let rust = Language(initLanguage: "Rust", initImage: UIImage(named: "rust")!, initDeveloper: "Mozilla", initYear: "2010")
        let go = Language(initLanguage: "Go", initImage: UIImage(named: "go")!, initDeveloper: "Google", initYear: "2009")
        
        languageArray.append(kotlin)
        languageArray.append(swift)
        languageArray.append(rust)
        languageArray.append(go)
        
        navigationItem.title = "Languages"
    }
    
    // Row sola cekilir ise ilgili elemani sil.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            languageArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    // Gosterilecek verileri belirt.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = languageArray[indexPath.row].language
        return cell
    }
    
    // Table View icerisindeki row sayisini belirt.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    // Table View'da bir Row'a tiklandiginda ilgili verinin detaylarini goruntule.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Secilen row verilerini gonderilecek row verilerine ata.
        chosenLanguage = languageArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsSegue", sender: nil)
    }
    
    // Segue baslamadan once kontrolleri ve atamalari gerceklestir.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetailsSegue"){
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedLanguage = chosenLanguage
        }
    }
}
