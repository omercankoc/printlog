import Foundation
import UIKit

struct Language : Identifiable {
    var id = UUID()
    var language : String
    var image : String
    var developer : String
    var year : String
}

let swift = Language(language: "Swift", image: "swift", developer: "Apple",year: "2014")
let kotlin = Language(language: "Kotlin", image: "kotlin", developer: "JetBrains",year: "2011")
let go = Language(language: "Go", image: "go", developer: "Google",year: "2009")
let rust = Language(language: "Rust", image: "rust", developer: "Mozilla Foundation",year: "2010")
let python = Language(language: "Python", image: "python", developer: "Guido van Rossum",year: "1991")
let ruby = Language(language: "Ruby", image: "ruby", developer: "Yukihiro Matsumoto",year: "1995")
let php = Language(language: "PHP", image: "php", developer: "Rasmus Lerdorf",year: "1995")
let java = Language(language: "Java", image: "java", developer: "James Gsoling",year: "1995")
let csharp = Language(language: "C#", image: "csharp", developer: "Anders Hejlsberg",year: "2000")
let c = Language(language: "C", image: "c", developer: "Dennis Ritchie",year: "1972")
let cplusplus = Language(language: "C++", image: "cplusplus", developer: "Bjarne Stroustrup",year: "1985")
let javascript = Language(language: "JavaScript", image: "js", developer: "Brendan Eich",year: "1995")
let typescript = Language(language: "TypeScript", image: "ts", developer: "Microsoft",year: "2012")



var languages : [Language] = [swift,kotlin,go,rust,python,ruby,php,java,csharp,c,cplusplus,javascript,typescript]



