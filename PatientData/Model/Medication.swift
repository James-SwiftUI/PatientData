import Foundation
import SwiftData

@Model
final class Medication{
    //@Attribute(.unique)
    var name: String
    var dosage: String
    
    var patients: [Patient]?
    
    init(name: String = "",
         dosage: String = "") {
        self.name = name
        self.dosage = dosage
    }
    
}
