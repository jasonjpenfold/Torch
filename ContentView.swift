import SwiftUI

struct ContentView: View {
    @State private var torchIsOn = false
    @Environment(TorchViewModel.self) private var model
    var body: some View {
        ZStack{
            Color.black.opacity(model.isOn ? 0.9 : 0.5)
            
            VStack(spacing: 36) {
                
                Spacer()
                
                Text(model.isOn ? "TORCH ON" : "TORCH OFF")
                        .font(.system(.subheadline, design: .rounded))
                        .bold()
                        .foregroundStyle(model.isOn ? .white : .black)
                        .shadow(color: model.isOn ? .yellow : .clear, radius: 40)
                        
                Spacer()
                Image(systemName: "flashlight.on.fill")
                    .font(.system(size: 120, weight: .bold, design: .rounded))
                    .foregroundStyle(model.isOn ? .yellow : .white)
                    .scaleEffect(model.isOn ? 1.05 : 1)
                    
                Spacer()
                Button{
                    withAnimation{
                        model.toggleTorchMode()
                    }
                                        
                }label:{
                    Image(systemName: "power.circle").foregroundStyle(.white)
                        .font(.system(size: 80, weight: .medium, design: .rounded))
                    
                    
                }
                .buttonStyle(.borderless)
                .tint(model.isOn ? .orange : .gray)
                
                Spacer()
                
                
            }.padding()
            
        }
    }
        
    
    
    
}
