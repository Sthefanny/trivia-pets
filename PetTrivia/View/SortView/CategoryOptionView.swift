//
//  CategoryOptionView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 22/06/21.
//

import SwiftUI

struct CategoryOptionView: View {
    @State var text: String
    var radius = CGFloat(38)
    
    var body: some View {
        Button(action: { }, label: {
          Text(text)
            .font(Font.custom("HelveticaNeue", size: 18))
            .fontWeight(.medium)
            .foregroundColor(Color("BlueCardTextColor"))
            .padding(.vertical, 20)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.white)
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

struct CategoryOptionView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryOptionView(text: "Aleatório")
    }
}
