import SwiftUI
import AVFoundation

@Observable
class TorchViewModel{
    private(set) var isOn = false
    var errorMessage: TorchError? = nil
    
    func toggleTorchMode(){
        guard let device = AVCaptureDevice.default(for: .video) else {self._errorMessage = TorchError.torchNotAvailable
            return}
        
        if device.hasTorch{
            
            do{
                try device.lockForConfiguration()
                // Changing torch mode
                device.torchMode =  !self.isOn ? .on : .off
                
                device.unlockForConfiguration()
            }catch{
                self.errorMessage = TorchError.torchNotAvailable
                return
            }
            self.isOn = device.torchMode == .on
        }else{
            self.errorMessage =  TorchError.noTorchPresent
        }
    }
}
