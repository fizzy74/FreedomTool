import SwiftUI

struct IntroStepView: View {
    @EnvironmentObject var appViewModel: AppView.ViewModel
    
    let step: IntroController.Step
    
    var body: some View {
        VStack {
            VStack {
                if step != .zero {
                    Text(LocalizedStringKey(step.title))
                        .font(.custom("Inter-Bold", size: 22))
                        .frame(height: 30)
                    Text(LocalizedStringKey(step.description))
                        .multilineTextAlignment(.center)
                        .font(.custom("Inter-Regular", size: 15))
                        .opacity(0.5)
                }
                if step == .zero {
                    HStack {
                        Text(LocalizedStringKey(step.title))
                            .font(.custom("Inter-Bold", size: 22))
                            .frame(height: 30)
                            .padding(.leading)
                            .padding(.leading)
                        Spacer()
                        LocalizationSwitcherView()
                    }
                    HStack {
                        Text(LocalizedStringKey(step.description))
                            .font(.custom("Inter-Regular", size: 15))
                            .opacity(0.5)
                            .frame(width: 300)
                        Spacer()
                    }
                }
                
            }
            .frame(width: 350)
            .padding(.top)
            .padding(.top)
            Spacer()
            Image(step.imageName)
                .resizable()
                .frame(
                    width: step.imageResolution.width,
                    height: step.imageResolution.height
                )
            Text(LocalizedStringKey(step.subDescription))
                .font(.custom("Inter-Regular", size: 15))
                .padding(.top)
                .opacity(0.5)
            Spacer()
        }
    }
}

#Preview {
    IntroStepView(step: .one)
        .environmentObject(AppView.ViewModel())
}
