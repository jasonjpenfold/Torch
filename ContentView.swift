import SwiftUI

struct ContentView: View {
    @State private var torchIsOn = false
    @Environment(TorchViewModel.self) private var model
    var body: some View {
        
        VStack {
            Image(systemName: "flashlight.on.circle.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Torch!")
            
            Button(model.isOn ? "On":"Off"){
                model.toggleTorchMode()
                
            }.buttonStyle(.glassProminent)
            
            
        }
    }
    
    
}
