import SwiftUI
import SwiftData
struct ContentView: View {
    
    @Query(sort: \Medication.name) var medications: [Medication]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(medications){ medication in
                    VStack(alignment: .leading){
                      
                            HStack{
                                Text(medication.name)
                                Spacer()
                                Image(systemName: "pill.circle.fill")
                                    .font(.title3)
                                
                            }
                           
                            Text(medication.dosage)
                            
                     
                        
                        
                        
                    }
                }
            }
            .navigationTitle("Medications")
        }
    }
}

#Preview {
    ContentView()
}
