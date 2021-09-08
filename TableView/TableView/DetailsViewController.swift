import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var developer: UILabel!
    @IBOutlet weak var year: UILabel!
    
    var selectedLanguage : String = ""
    var selectedImage : UIImage = UIImage()
    var selectedDeveloper : String = ""
    var selectedYear : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        language.text = selectedLanguage
        image.image = selectedImage
        developer.text = selectedDeveloper
        year.text = selectedYear
    }
}
