//
//  SortView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 22/06/21.
//

import SwiftUI

struct SortView: View {
    @State var frame: CGSize = .zero
    
    var body: some View {
        HStack {
            GeometryReader { (geometry) in
                self.makeView(geometry)
            }
        }
        .background(
            Image("SortBg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        )
    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
        print(geometry.size.width, geometry.size.height)

        DispatchQueue.main.async { self.frame = geometry.size }

        return VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 33)
                    .foregroundColor(Color.white)
                    .opacity(0.5)
                
                VStack {
                    Text("Alimentação")
                        .font(Font.custom("HelveticaNeue", size: 45))
                        .fontWeight(.medium)
                        .foregroundColor(Color("BlueTextColor"))
                    Text("Sorteio de categorias")
                        .font(Font.custom("HelveticaNeue", size: 30))
                        .fontWeight(.thin)
                        .foregroundColor(Color("BlueTextColor"))
                        .padding(.bottom, 30)
                    
                    CategoryOptionView(text: "Aleatório")
                    CategoryOptionView(text: "Comidas Permitidas")
                    CategoryOptionView(text: "Alimentação Natural")
                    CategoryOptionView(text: "Enriquecimento Ambiental")
                }
            }
            }
        .padding(.vertical, 20)
        .padding(.horizontal, 30)
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}
