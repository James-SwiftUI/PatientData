import SwiftData
import SwiftUI

@Model
final class Patient{
    
    var firstName: String
    var lastName: String
    var dob: Date
    var status: Status.RawValue
    var department: Department?
    @Relationship(inverse: \Medication.patients)
    var medications: [Medication]?
    
    
    init(
        firstName: String = "",
        lastName: String = "",
        dob: Date = .now,
        status: Status = .Outpatient
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.dob = dob
        self.status = status.rawValue
    }
    
    
    var icon: Image{
        switch Status(rawValue: status)!{
            
        case .Inpatient:
            Image(systemName: "bed.double.circle.fill")
        case .Outpatient:
            Image(systemName: "stethoscope.circle.fill")
        case .Emergency:
            Image(systemName: "cross.case.circle.fill")
        }
    }
    
    var description: String{
        switch Status(rawValue: status)!{
            
        case .Inpatient:
            "Inpatient"
        case .Outpatient:
            "Outpatient"
        case .Emergency:
            "Emergency"
        }
    }
    
    var age:(years: Int, months: Int, days: Int){
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year, .month, .day], from: dob, to: .now)
        
        let years = ageComponents.year ?? 0
        let months = ageComponents.month ?? 0
        let days = ageComponents.day ?? 0
        
        return (years, months, days)
        
    }
    
   
}



enum Status: Int, Codable, Identifiable, CaseIterable{
    case Inpatient, Outpatient, Emergency
    
    var id: Self{
        return self
    }
    
    var description: String{
        switch self{
            
        case .Inpatient:
            "Inpatient"
        case .Outpatient:
            "Outpatient"
        case .Emergency:
            "Emergency"
        }
    }
    
    var icon: String{
        switch self{
            
        case .Inpatient:
            "bed.double.circle.fill"
        case .Outpatient:
            "stethoscope.circle.fill"
        case .Emergency:
            "cross.case.circle.fill"
        }
    }
    
}
