import SwiftUI
import SwiftData
struct ContentView: View {
    
    @Query(sort: \Medication.name) var medications: [Medication]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(medications){ medication in
                    VStack(alignment: .leading){
                        Text(medication.name)
                        Text(medication.dosage)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
