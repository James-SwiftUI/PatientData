import SwiftUI

struct SelectorView: View {
    
    @State private var selectedView = false
    @Namespace private var animation
    
    var body: some View {
        NavigationStack{
            ScrollView {
                HStack(spacing: 0){
                    Text("Acute")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 12)
                        
                    Text("Community")
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(
                            Capsule().fill(selectedView ? Color(UIColor.systemBackground) : Color.pink)
                        )

                        
            
                }
                .background(.gray.opacity(0.15), in: .capsule)
                .padding(.top, 5)
                .navigationTitle("New Page")
                .padding(.horizontal, 5)
            }
            .background(.ultraThinMaterial)
            
        }
        
    }
}

#Preview {
    SelectorView()
}
