//
//  MyPetViewCard.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 01/07/21.
//

import SwiftUI

struct MyPetViewButton: View {
    
    @State var dog: Dog
 
    var body: some View {
        Button(action: {
                dog.dogHat = "frog"
            
        }, label: {
            Image("dog.dogHat")
                .resizable()
                .aspectRatio(contentMode: .fit)

        })
        .frame(height: 80)
    }
}

struct MyPetViewCard_Previews: PreviewProvider {
    static var previews: some View {
        MyPetViewCard(dog: (Dog.init(dogName: "pantufa", dogHat: "strawberry")))
            .environmentObject(UserDefaultsWrapper())
    }
}
