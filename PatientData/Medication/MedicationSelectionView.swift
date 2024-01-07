import SwiftData
import SwiftUI

struct MedicationSelectionView: View {
    
    @State private var showAddMedicationView = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    @Bindable var patient: Patient
    
    @Query(sort: \Medication.name) var medications: [Medication]
    
    var body: some View {
        NavigationStack{
            Group{
                if medications.isEmpty{
                    ContentUnavailableView{
                        Image(systemName: "pills")
                    }description: {
                        Text("Please add a new medication")
                    }actions: {
                        addMedicationBtn
                        
                    }
                }else{
                    List{
                        ForEach(medications){ medication in
                            HStack{
                                if let patientMedications = patient.medications{
                                    if patientMedications.isEmpty{
                                        Button{
                                            addRemove(medication)
                                        }label: {
                                            Image(systemName: "circle")
                                        }
                                    }else{
                                        Button{
                                            addRemove(medication)
                                        }label: {
                                            Image(systemName: patientMedications.contains(medication) ?  "circle.fill" : "circle")
                                        }
                                    }
                                }
                                Text(medication.name)
                            }
                                                       
                        }
                
                        addMedicationBtn
                    }
                    
                }
            }
            .fullScreenCover(isPresented: $showAddMedicationView){
                AddMedicationView()
            }
            .toolbar{
                ToolbarItem{
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "x.circle.fill")
                    }
                }
            }
        }
    }
    
    func addRemove(_ medication: Medication){
        if let patientMedications = patient.medications{
            if patientMedications.isEmpty{
                patient.medications?.append(medication)
            }else{
                if patientMedications.contains(medication),
                   let index = patientMedications.firstIndex(where: { $0.id == medication.id}){
                    patient.medications?.remove(at: index)
                }else{
                    patient.medications?.append(medication)
                }
            }
        }
    }
}

private extension MedicationSelectionView{
    
    var addMedicationBtn: some View{
        Button("Add medication"){
            showAddMedicationView.toggle()
        }
    }
    
}

//#Preview {
//    MedicationSelectionView()
//}
