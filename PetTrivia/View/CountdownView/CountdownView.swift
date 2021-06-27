//
//  CountdownView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 23/06/21.
//
import SwiftUI
import Combine

class PulsatingViewModel: ObservableObject {
    @Published var colorIndex = 0
    @Published var countText = "3"
}

struct PulsatingView: View {
    @ObservedObject var viewModel: PulsatingViewModel
    
    @State var animate = false
    @State private var timeRemaining = 3
    
    @State private var isScreenActive = false
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var circleColor = Color("YellowCircleColor")
    
    var body: some View {
            VStack {
                ZStack {
                    NavigationLink(destination: GameView(currentCategory: QuestionCategory(rawValue: selectedCategory.text)!)
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true), isActive: $isScreenActive){}
                    Circle().fill(circleColor.opacity(0.3)).frame(width: 200, height: 200).scaleEffect(self.animate ? 1 : 0)
                    Circle().fill(circleColor.opacity(0.9)).frame(width: 148, height: 148).scaleEffect(self.animate ? 1 : 0)
                    Text("\(timeRemaining)")
                        .font(Font.custom("HelveticaNeue", size: 96))
                        .fontWeight(.medium)
                        .foregroundColor(Color("BlueTextColor"))
                        .scaleEffect(self.animate ? 1 : 0)
                }
                .onAppear {
                    DispatchQueue.main.async {
                        self.animate = true
                    }
                }
                .animation(animate ? Animation.easeInOut(duration: 1).repeatCount(5, autoreverses: true).delay(0.1) : .default)
            }
            .onReceive(timer) { time in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                    if self.timeRemaining == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.95, execute: {
                            self.isScreenActive = true
                        })
                    }
                }
        }
    }
}

struct CountdownView: View {
    @State var frame: CGSize = .zero
    
    private var model = PulsatingViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("CountdownBg").resizable().edgesIgnoringSafeArea(.all)
                HStack {
                    GeometryReader { (geometry) in
                        self.makeView(geometry)
                    }
                }
            }
        }
    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
            print(geometry.size.width, geometry.size.height)

            DispatchQueue.main.async { self.frame = geometry.size }

        return VStack(alignment: .center) {
            Text("Se prepare!")
                .font(Font.custom("HelveticaNeue", size: 34))
                .fontWeight(.bold)
                .foregroundColor(Color("BlueCardTextColor"))
            Text("VOCÊ TERÁ 60 SEGUNDOS PARA\nRESPONDER A PERGUNTA")
                .font(Font.custom("HelveticaNeue", size: 14))
                .fontWeight(.medium)
                .foregroundColor(Color("GrayTextColor"))
                .multilineTextAlignment(.center)
                .padding(.top, 10)
                .padding(.bottom, 40)

            PulsatingView(viewModel: model)
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
