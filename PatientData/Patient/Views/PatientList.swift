import SwiftUI
import SwiftData

struct PatientList: View {
    
    @Environment(\.modelContext) var context
    @Query(sort: \Patient.status) private var patients: [Patient]
    
    init(sortOrder: SortOrder){
        let sortDescriptors: [SortDescriptor<Patient>] = switch sortOrder{
        case .status:
            [SortDescriptor(\Patient.status), SortDescriptor(\Patient.lastName)]
        case .lastname:
            [SortDescriptor(\Patient.lastName)]
        case .doctor:
            [SortDescriptor(\Patient.status), SortDescriptor(\Patient.lastName)]
        }
        
        _patients = Query(sort: sortDescriptors)
    }
    
    var body: some View {
        Group{
            if patients.isEmpty{
                ContentUnavailableView("Please enter your first patient", systemImage: "person.circle.fill")
            }else{
                List{
                    ForEach(patients){ patient in
                        NavigationLink{
                            EditPatientView(patient: patient)
                            
                        }label: {
                            VStack(alignment: .leading, spacing: 8){
                                HStack{
                                    
                                    Text(patient.firstName)
                                    Text(patient.lastName)
                                    Spacer()
                                    
                                
                                    patient.icon
                                        .font(.title3)
                                    Text(patient.description)
                                        .font(.caption)
                                        
                                        
                                    
                                    
                                    
                                }
                                if let department = patient.department{
                                    Label(department.name, systemImage: department.icon)
                                        .padding(.horizontal)
                                        .padding(.vertical, 6)
                                        .background(Color.blue.opacity(0.2), in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                                }
                                HStack{
                                    Text("DOB: ")
                                    Text(patient.dob, format: .dateTime.year().month().day())
                                        .fontWeight(.semibold)
                                }
                                
                                HStack(spacing: 4){
                                    
                                    Text("^[\(patient.age.years) Years](inflect: true)")
                                    Text("^[\(patient.age.months) Months](inflect: true)")
                                    Text("and ^[\(patient.age.days) Days](inflect: true) old")
                                    
                                }
                                .font(.caption)
                                if let medications = patient.medications{
                                    if !medications.isEmpty{
                                        ViewThatFits{
                                            PatientMedications(medications: medications)
                                            ScrollView(.horizontal, showsIndicators: false){
                                                PatientMedications(medications: medications)
                                            }
                                        }
                                        
                                            
                                    }
                                }
                            }
                        }
                    }.onDelete{ indexSet in
                        indexSet.forEach{ index in
                            let patient = patients[index]
                            context.delete(patient)
                        }
                    }
                    
                }
            }
        }
    }
}

//#Preview {
//    PatientList()
//}
