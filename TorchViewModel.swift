import SwiftUI
import AVFoundation

@Observable
class TorchViewModel{
    private(set) var isOn = false
    
    
    init(){
        
    }
    
    func toggleTorchMode(){
        guard let device = AVCaptureDevice.default(for: .video) else {return}
        
        if device.hasTorch{
            print("I have a torch")
            do{
                try device.lockForConfiguration()
                print("Changing torch mode")
                device.torchMode =  !self.isOn ? .on : .off
                
                device.unlockForConfiguration()
            }catch{
                print("Torch not available")
            }
            self.isOn = device.torchMode == .on
        }else{
            print("Torch not available")
        }
    }
}
