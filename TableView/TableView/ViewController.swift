import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // Languages dizisi olustur.
    var languages = [String]()
    // Language Images dizisi olustur.
    var images = [UIImage]()
    // Language Developer dizisi olustur.
    var developer = [String]()
    // Language Year dizisi olustur.
    var year = [String]()
    
    // Secilen Row'un ilgili verileri.
    var chosenLanguage : String = ""
    var chosenImage : UIImage = UIImage()
    var chosenDeveloper : String = ""
    var chosenYear : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Dizilere verileri ekle.
        languages.append("Kotlin")
        languages.append("Swift")
        languages.append("Rust")
        languages.append("Go")
                
        images.append(UIImage(named: "kotlin")!)
        images.append(UIImage(named: "swift")!)
        images.append(UIImage(named: "rust")!)
        images.append(UIImage(named: "go")!)
                
        developer.append("JetBrains")
        developer.append("Apple")
        developer.append("Mozilla")
        developer.append("Google")
                
        year.append("2011")
        year.append("2014")
        year.append("2010")
        year.append("2009")
        
        navigationItem.title = "Languages"
    }
    
    // Row sola cekilir ise ilgili elemani sil.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            languages.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            developer.remove(at: indexPath.row)
            year.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    // Gosterilecek verileri belirt.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = languages[indexPath.row]
        return cell
    }
    
    // Table View icerisindeki row sayisini belirt.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    // Table View'da bir Row'a tiklandiginda ilgili verinin detaylarini goruntule.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Secilen row verilerini gonderilecek row verilerine ata.
        chosenLanguage = languages[indexPath.row]
        chosenImage = images[indexPath.row]
        chosenDeveloper = developer[indexPath.row]
        chosenYear = year[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsSegue", sender: nil)
    }
    
    // Segue baslamadan once kontrolleri ve atamalari gerceklestir.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetailsSegue"){
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedLanguage = chosenLanguage
            destinationVC.selectedImage = chosenImage
            destinationVC.selectedDeveloper = chosenDeveloper
            destinationVC.selectedYear = chosenYear
        }
    }
}
