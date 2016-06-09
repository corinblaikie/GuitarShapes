import Foundation

class GuitarString {
    
    let index:Int
    let name:String
    
    static let lowEString = GuitarString(index: 0, name: "E")
    static let aString = GuitarString(index: 1, name: "A")
    static let dString = GuitarString(index: 2, name: "D")
    static let gString = GuitarString(index: 3, name: "G")
    static let bString = GuitarString(index: 4, name: "B")
    static let hightEString = GuitarString(index: 5, name: "E")
    
    init(index:Int, name:String) {
        self.index = index
        self.name = name
    }
}