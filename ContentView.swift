import SwiftUI

struct ContentView: View {
    
    @Environment(TorchViewModel.self) private var model
    
    var body: some View {
        @Bindable var model = model
        ZStack{
            background
            
            VStack(spacing: 36) {
                
                Spacer()
                torchDisplay
                
                Spacer()
                control
                
                Spacer()
                
                
            }.padding()
                .alert(item: $model.errorMessage){ error in 
                    Alert(title: Text("Error"), message: Text( "\(error.localizedDescription)"), dismissButton: .cancel())
                }
        }
    }
        
    private var background: some View{
        Color.black
            .ignoresSafeArea()
    }
    
    private var torchDisplay: some View{
        
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(.white.opacity(0.07))
                .accessibilityHidden(true)
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
                        
                        
                    }.accessibilityElement(children: .combine)
                        .accessibilityLabel("Torch")
                        .accessibilityValue(model.isOn ? "On" : "Off")
            
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
                        .font(.system(size: 70, weight: .medium, design: .rounded))
                        .foregroundStyle(model.isOn ? .yellow : .white)
                      
                        
                }
                        
        }
        .buttonStyle(TorchButtonStyle())
        .sensoryFeedback(.impact(weight: .light), trigger: model.isOn)
        .accessibilityLabel("Torch")
        .accessibilityValue(model.isOn ? "On" : "Off")
        .accessibilityHint("Turns the torch on or off")
        
        
    }
    
}
