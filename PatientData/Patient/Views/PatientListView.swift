import SwiftUI

struct PatientListView: View {
    
    @State private var showAddPatient = false
    @State private var showAddDepartment = false
    @State private var userSortOrder = SortOrder.status
    @State private var userSearch: String = ""
    
    var body: some View {
        NavigationStack{
            PatientList(sortOrder: userSortOrder)
                .navigationTitle("Patients")
                .searchable(text: $userSearch, prompt: "Search for a patient by last name")
                .toolbar{
                    ToolbarItemGroup{
                        Menu{
                            Picker("", selection: $userSortOrder){
                                ForEach(SortOrder.allCases){ sortOrder in
                                    
                                    Label(sortOrder.description, systemImage: sortOrder.symbol)
                                        .tag(sortOrder)
                                }
                            }
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .symbolVariant(.circle)
                        }
                        
                        
                    }
                    ToolbarItemGroup(placement: .topBarLeading){
                        Button{
                            showAddPatient = true
                        }label: {
                            Image(systemName: "plus.circle.fill")
                                .imageScale(.large)
                        }
                        
                        Button{
                            //screen to be used to test will preload the JSON
                            showAddDepartment = true
                        }label: {
                            Image(systemName: "plus.square.fill")
                                .imageScale(.large)
                        }
                       
                    }
                    
                }
                .sheet(isPresented: $showAddPatient){
                    AddPatientView()
                }
                .sheet(isPresented: $showAddDepartment){
                    AddDepartmentView()
                }
        }
        
            
    }
}

#Preview {
    PatientListView()
}
