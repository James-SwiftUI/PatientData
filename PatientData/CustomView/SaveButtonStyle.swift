import SwiftUI

struct SaveButtonStyle: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.teal)
            .cornerRadius(12)
            .foregroundStyle(.white)
        
    }
    
}


extension View {
    func customStyle() -> some View {
        self.modifier(SaveButtonStyle())
    }
}
