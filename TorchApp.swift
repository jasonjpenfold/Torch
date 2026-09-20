import SwiftUI

@main
struct TorchApp: App {
    @State private var model = TorchViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
