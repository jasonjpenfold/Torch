import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var torchIsOn = false
    
    var body: some View {
        
        VStack {
            Image(systemName: "flashlight.on.circle.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Torch!")
            
            Button(torchIsOn ? "On":"Off"){
                torchIsOn = toggleTorchMode(on: !torchIsOn)
            }.buttonStyle(.glassProminent)
            
            
        }
    }
    
    func toggleTorchMode(on: Bool)->Bool{
        guard let device = AVCaptureDevice.default(for: .video) else {return false}
        
        if device.hasTorch{
            print("I have a torch")
            do{
                try device.lockForConfiguration()
                print("Changing torch mode")
                device.torchMode =  on ? .on : .off
                
                device.unlockForConfiguration()
            }catch{
                print("Torch not available")
            }
        
            return device.torchMode == .on
        }else{
            print("Torch not available")
            return false
        }
    }
}
