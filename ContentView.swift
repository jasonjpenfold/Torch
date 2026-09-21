import SwiftUI

struct ContentView: View {
    
    @Environment(TorchViewModel.self) private var model
    var body: some View {
        ZStack{
            background
            
            VStack(spacing: 36) {
                
                //Spacer()
               // header
                
                Spacer()
                torchDisplay
                
                Spacer()
                control
                
                Spacer()
                
                
            }.padding()
            
        }
    }
        
    private var background: some View{
        Color.black
            .ignoresSafeArea()
    }
    private var header: some View{
        Text("TORCH")
            .font(.system(.subheadline, design: .rounded))
            .bold()
            .foregroundStyle(.white)
    }
    private var torchDisplay: some View{
        
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(.white.opacity(0.07))
                .frame(width: 200)
                .blur(radius: 5)
                .overlay{
                    VStack(spacing: 20){
                        Image(systemName: "flashlight.on.fill")
                            .font(.system(size: 200, weight: .bold, design: .rounded))
                            .foregroundStyle(model.isOn ? .yellow : .white)
                            .scaleEffect(model.isOn ? 1.05 : 1)
                            .opacity(model.isOn ? 1 : 0.45)
                            .animation(.easeInOut(duration: 0.25), value: model.isOn)
                        
                        Text(model.isOn ? "ON" : "OFF")
                            .foregroundStyle(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                        
                        
                    }
                                    }
                    
            }
    private var control: some View{
        Button{
            model.toggleTorchMode()
            
            
        }label:{
            Circle()
                .fill(.white.opacity(0.15))
                .frame(width: 110, height: 110)
                .blur(radius: 4)
                .overlay{
                    
                    Image(systemName: "power")
                        .font(.system(size: 80, weight: .medium, design: .rounded))
                        .foregroundStyle(model.isOn ? .yellow : .white)
                      
                        
                }
                        
        }
        .buttonStyle(TorchButtonStyle())
        
        
    }
    
}
