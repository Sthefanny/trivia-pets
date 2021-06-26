//
//  WikiPetView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 26/06/21.
//

import SwiftUI

struct WikiPetView: View {
    var body: some View {
        ZStack {
            Image("CountdownBg").resizable().edgesIgnoringSafeArea(.all)
            HStack{
                Image("PetizLogoPaw")
                    .resizable()
                    .aspectRatio(contentMode: .fill)

            }
        }
    }
}

struct WikiPetView_Previews: PreviewProvider {
    static var previews: some View {
        WikiPetView()
    }
}
