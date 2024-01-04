import Foundation


enum SortOrder: String, Identifiable, CaseIterable{
    case status, lastname, doctor
    
    var id: Self{
        self
    }
    
    var description: String{
        switch self{
            
        case .status:
            "Current Status"
        case .lastname:
            "Last name"
        case .doctor:
            "Doctor"
        }
    }
    
    
    var symbol: String{
        switch self{
            
        case .status:
            "cross.case.circle.fill"
        case .lastname:
            "person.circle.fill"
        case .doctor:
            "stethoscope.circle.fill"
        }
    }
    
}
