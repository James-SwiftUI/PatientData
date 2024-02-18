import SwiftUI
import SwiftData

struct AddDepartmentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var departments: [Department]
    
    @State private var name: String = ""
    @State private var icon: String = ""
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Department name", text: $name)
                        .autocorrectionDisabled()
                    TextField("Icon name", text: $icon)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                      
                    
                    Button("Create"){
                        withAnimation{
                            let department = Department(name: name, icon: icon)
                            modelContext.insert(department)
                            department.patient = []
                            name = ""
                            icon = ""
                        }
                    }
                    .disabled(name.isEmpty && icon.isEmpty)
                    .buttonBorderShape(.capsule)
                }header: {
                    Text("Add Department")
                }
                Section{
                    ForEach(departments){ department in
                        
                        Label(department.name, systemImage: department.icon)
                            .symbolRenderingMode(.multicolor)
                            .swipeActions{
                            Button(role: .destructive){
                                withAnimation{
                                    modelContext.delete(department)
                                }
                            }label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                    }
                }header: {
                    Text("All Departments")
                }
                
                
           
            }
            .navigationTitle("Department")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

//#Preview {
//    AddDepartmentView()
//}
