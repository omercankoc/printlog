import Foundation
import UIKit

class Language {
    var language : String = ""
    var image : UIImage = UIImage()
    var developer : String = ""
    var year : String = ""
    
    init(initLanguage : String, initImage : UIImage, initDeveloper : String, initYear : String) {
        language = initLanguage
        image = initImage
        developer = initDeveloper
        year = initYear
    }
}
