import Foundation
import SwiftData

@Model
final class Department{
    
    @Attribute(.unique)
    var name: String
    var icon: String
    @Relationship(inverse: \Patient.department)
    var patient: [Patient]?
    
    init(name: String = "",
         icon: String = ""){
        self.name = name
        self.icon = icon
    }

}
