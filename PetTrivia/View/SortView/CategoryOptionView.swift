//
//  CategoryOptionView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 22/06/21.
//

import SwiftUI
import Combine

class CategoryOptionViewModel: ObservableObject {
    @Published var selectedId: Int?
}

struct CategoryOptionView: View {
    @ObservedObject var viewModel: CategoryOptionViewModel
    
    @State var id: Int
    @State var text: String
    
    @State private var isScreenActive = false
    
    var radius = CGFloat(38)
    
    var circleColor = Color("YellowCircleColor")
    
    var body: some View {
            VStack {
                ZStack {
                    Button(action: { }, label: {
                      Text(text)
                        .font(Font.custom("HelveticaNeue", size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(Color("BlueCardTextColor"))
                        .padding(.vertical, 20)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(viewModel.selectedId == id ? Color("YellowCardColor") : Color.white)
                        .opacity(0.8)
                        .cornerRadius(radius)
                        .overlay(
                            RoundedRectangle(cornerRadius: radius)
                                .stroke(Color.yellow, lineWidth: 1))
                    })
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                }
            }
    }
}
