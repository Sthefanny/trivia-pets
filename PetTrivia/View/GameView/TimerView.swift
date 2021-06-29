//
//  TimerView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 21/06/21.
//

import SwiftUI

struct TimerView: View {
    @Binding var timeRemaining: Int
    @Binding var disabledButton: Bool
    @Binding var selectedOptions: [Int]
    @Binding var currentPosition: Int
    @State private var isActive = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .strokeBorder(Color("LightStroke"))
                    .frame(width: 55, height: 55)
                    .overlay(
                        Image(systemName: "arrow.backward")
                            .frame(width: 18.7,height: 18)
                    )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            Text(timeRemaining > 59 ? "1:00" : timeRemaining >= 10 ? "0:\(timeRemaining)" : "0:0\(timeRemaining)")
                .font(.custom("Helvetica Neue", size: 36))
                .bold()
                .foregroundColor(Color(timeRemaining > 9 ? "LightBlack" : "WrongColor"))
                .frame(maxWidth: .infinity, alignment: .center)
                
        }
        .onReceive(timer) { time in
            guard self.isActive else {return}
            if self.timeRemaining > 0 && disabledButton == false {
                    self.timeRemaining -= 1
            } else if self.timeRemaining <= 0 {
                selectedOptions.append(0)
                currentPosition += 1
                timeRemaining = 60
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.isActive = true
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timeRemaining: .constant(60), disabledButton: .constant(false), selectedOptions: .constant([]), currentPosition: .constant(1))
    }
}
