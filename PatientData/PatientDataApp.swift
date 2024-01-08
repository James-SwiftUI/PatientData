import SwiftUI
import SwiftData
@main
struct PatientDataApp: App {
    
    @AppStorage("isFirstTimeLaunch") private var isFirstTimeLaunch: Bool = true
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        //.modelContainer(for: Patient.self)
        .modelContainer(PatientsContainer.create(createDefaults: &isFirstTimeLaunch))
    }
    
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }

}

