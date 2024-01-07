import SwiftUI
import SwiftData

struct AddPatientView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @Query private var departments: [Department]
    
    @State private var patient = Patient()
    @State private var selectedDepartment: Department?
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("First Name", text: $patient.firstName)
                TextField("Last Name", text: $patient.lastName)
                
                        
                DatePicker("DOB", selection: $patient.dob, in: dateRange, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                
                Button("Add"){
                    withAnimation{
                        save()
                    }
                    
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .padding(8)
                .disabled(patient.firstName.isEmpty || patient.lastName.isEmpty)
                
                
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
                    Text("Select Department")
                }
            }
            .navigationTitle("Add Patient")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
    
    var dateRange: ClosedRange<Date> {
        let earliestDate = Calendar.current.date(byAdding: .year, value: -120, to: Date())!
        let latestDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        return earliestDate...latestDate
    }
}

//#Preview {
//    AddPatientView()
//}

private extension AddPatientView{
    func save(){
        context.insert(patient)
        patient.department = selectedDepartment
        selectedDepartment?.patient?.append(patient)
    }
}
