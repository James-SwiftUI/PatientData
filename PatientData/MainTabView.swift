import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            PatientListView()
                .tabItem {
                    Label("Patients", systemImage: "person.3.fill")
                }
            ContentView()
                .tabItem {
                    Label("Medications", systemImage: "pills.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}
