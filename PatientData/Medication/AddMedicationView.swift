// To check the saving of Medications

import SwiftUI

struct AddMedicationView: View {
    
    @State private var name = ""
    @State private var dosage = ""
    @Environment(\.modelContext) private var context
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Medication Name", text: $name)
                    .autocorrectionDisabled()
                
                Picker("Select Dosage", selection: $dosage){
                    Text("50mg")
                        .tag("50mg")
                    Text("100mg")
                        .tag("100mg")
                    Text("150mg")
                        .tag("150mg")
                    Text("250mg")
                        .tag("250mg")
                }
                
                Button("Save"){
                    let medication = Medication(name: name, dosage: dosage)
                    context.insert(medication)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Create medication")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem{
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "x.circle.fill")
                            .imageScale(.large)
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack{
        AddMedicationView()
    }
    
}
