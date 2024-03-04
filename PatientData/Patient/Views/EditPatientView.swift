import SwiftUI
import SwiftData

struct EditPatientView: View {
    
    @Environment(\.modelContext) private var context
    let patient: Patient
    @Environment(\.dismiss) var dismiss
    
    //Only update when there are changes
    @State private var status = Status.Outpatient
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var dob: Date = .now

    @Query private var departments: [Department]
    @State private var selectedDepartment: Department?
    
    @State private var showMedicationView = false
    
    var body: some View {
        NavigationStack{
            Form{
                
                Section{
                    LabeledContent{
                        TextField("", text: $firstName)
                    }label: {
                        Text("First Name")
                            .foregroundStyle(.secondary)
                    }
                    LabeledContent{
                        TextField("", text: $lastName)
                    }label: {
                        Text("Last Name")
                            .foregroundStyle(.secondary)
                    }
                }header: {
                    Text("Patient Details")
                        .fontWeight(.bold)
                }
                
               
                
                
                Section{
                    
                    Picker("", selection: $status){
                        
                        ForEach(Status.allCases){ patientStatus in
                            Label(patientStatus.description, systemImage: patientStatus.icon)
                        }
                        
                        
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }header: {
                    Text("Patient Type")
                        .fontWeight(.bold)
                }
                
                Section{
                   
                    Picker("", selection: $selectedDepartment){
                        ForEach(departments){ department in
                            Label(department.name, systemImage: department.icon)
                                .tag(department as Department?)
                        }
                            
                            
                        Text("None")
                            .tag(nil as Department?)
                    }
                    .pickerStyle(.inline)
                    
                    
                }header: {
                    Text("Department")
                        .fontWeight(.bold)
                }
                
                Section{
                    Button("Medications", systemImage: "pills.circle"){
                        showMedicationView.toggle()
                    }
                    .fullScreenCover(isPresented: $showMedicationView){
                        MedicationSelectionView(patient: patient)
                    }
                }header: {
                    Text("Patient Medications")
                }
               
                if changed{
                    Section{
                        Button{
                            patient.firstName = firstName
                            patient.lastName = lastName
                            patient.dob = dob
                            patient.status = status.rawValue
                            patient.department = selectedDepartment
                            
                            dismiss()
                        }label: {
                            Text("Save Changes")
                        }
                        .customStyle()
                    }footer: {
                        Text("Update")
                    }
                    
                }
               
                
            }
            .navigationTitle("Edit Patient Name")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                status = Status(rawValue: patient.status)!
                firstName = patient.firstName
                lastName = patient.lastName
                dob = patient.dob
                selectedDepartment = patient.department
            }
        }
    }
    
    var changed: Bool{
        status != Status(rawValue: patient.status)
        || firstName != patient.firstName
        || lastName != patient.lastName
        || dob != patient.dob
        || selectedDepartment != patient.department
    }
    
    var dateRange: ClosedRange<Date> {
        let earliestDate = Calendar.current.date(byAdding: .year, value: -120, to: Date())!
        let latestDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        return earliestDate...latestDate
    }
}

//#Preview {
//    EditPatientView(patient: Patient())
//}
