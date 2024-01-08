import Foundation
import SwiftData

actor PatientsContainer{
    
    @MainActor
    static func create(createDefaults: inout Bool) -> ModelContainer{
        
        let schema = Schema([Patient.self])
        let configuration = ModelConfiguration("Patients", schema: schema)
        let container = try! ModelContainer(for: schema, configurations: [configuration])
        
        if createDefaults{
            createDefaults = false
            let departments = try? DepartmentsJSONDecoder.decode(from: "DepartmentDefaults")
            if departments?.isEmpty == false{
                departments?.forEach { item in
                    let department = Department(name: item.name, icon: item.icon)
                    container.mainContext.insert(department)
                }
            }
            
            let medications = try? MedicationsJSONDecoder.decode(from: "MedicationDefaults")
            if medications?.isEmpty == false{
                medications?.forEach{ item in
                    let medication = Medication(name: item.name, dosage: item.dosage)
                    container.mainContext.insert(medication)
                }
                
            }
            
            
        }
        
        
        
        
        return container
        
        
    }
    
    
    
}
