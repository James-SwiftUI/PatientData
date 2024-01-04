import SwiftUI

struct PatientMedications: View {
    
    var medications: [Medication]
    
    var body: some View {
        HStack{
            ForEach(medications){ medication in
                Text(medication.name)
                    .font(.caption)
                    .padding(5)
                    .background(Color.blue.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
    }
}

//#Preview {
//    PatientMedications()
//}
