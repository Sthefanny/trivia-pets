//
//  PulsatingView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 23/06/21.
//

//import SwiftUI
//import Combine
//
//class PulsatingViewModel: ObservableObject {
//    @Published var colorIndex = 0
//    @Published var countText = "3"
//}
//
//struct PulsatingView: View {
//    @ObservedObject var viewModel: PulsatingViewModel
//    
//    @State var animate = false
//    @State private var timeRemaining = 3
//    
//    @State private var isScreenActive = false
//    
//    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
//    
//    var circleColor = Color("YellowCircleColor")
//    
//    var body: some View {
//            VStack {
//                ZStack {
//                    NavigationLink(destination: HomeView()
//                                    .navigationBarHidden(true)
//                                    .navigationBarBackButtonHidden(true), isActive: $isScreenActive){}
//                    Circle().fill(circleColor.opacity(0.3)).frame(width: 266, height: 266).scaleEffect(self.animate ? 1 : 0)
//                    Circle().fill(circleColor.opacity(0.9)).frame(width: 214, height: 214).scaleEffect(self.animate ? 1 : 0)
//                    Text("\(timeRemaining)")
//                        .font(Font.custom("HelveticaNeue", size: 96))
//                        .fontWeight(.medium)
//                        .foregroundColor(Color("BlueTextColor"))
//                        .scaleEffect(self.animate ? 1 : 0)
//                }
//                .onAppear { self.animate = true }
//                .animation(animate ? Animation.easeInOut(duration: 1.5).repeatCount(5, autoreverses: true) : .default)
//            }
//            .onReceive(timer) { time in
//                if self.timeRemaining > 0 {
//                    self.timeRemaining -= 1
//                    if self.timeRemaining == 0 {
//                        self.isScreenActive = true
//                    }
//                }
//        }
//    }
//}
