import SwiftUI

struct PatientListView: View {
    var body: some View {
        NavigationStack{
            PatientList()
                .navigationTitle("Patients")
        }
        
            
    }
}

#Preview {
    PatientListView()
}
