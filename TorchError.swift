import SwiftUI

enum TorchError: Error, LocalizedError, Identifiable{
    

    case torchNotAvailable
    case noTorchPresent
    var id: Self {self}
    var errorDescription: String?{
        switch self {
        case .torchNotAvailable:
            return "Torch not available."
        case .noTorchPresent:
            return "No torch present on this device."
        }
    }
}
