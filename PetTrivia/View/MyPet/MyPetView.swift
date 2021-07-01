//
//  MyPetView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 29/06/21.
//

import SwiftUI

enum ButtonSelected {
    case doguitos
    case chapeuzitos
}

struct MyPetView: View {
    
    @State var dog: Dog
    
    @State var buttonSelected: ButtonSelected = .chapeuzitos
    
    @EnvironmentObject var userDefaultsWrapper: UserDefaultsWrapper
    
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                ZStack{
                    //imagem de fundo
                    Image("dogImageBackground")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    Image("\(dog.dogName)_\(dog.dogHat)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("\(dog.dogHat)_\(dog.dogName)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(50)
            }
            .frame(maxHeight: 200)
            Spacer()
            
            HStack{
                Button(action: {buttonSelected = .doguitos}, label: {
                    Text("doguitos")
                        .padding(10)
                        .background(buttonSelected == .doguitos ? Color("YellowCardColor") : Color("BlueCardColor"))
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.yellow, lineWidth: 1))
                })
                Button(action: {buttonSelected = .chapeuzitos}, label: {
                    Text("chapeuzitos")
                        .padding(10)
                        .background(buttonSelected == .chapeuzitos ? Color("YellowCardColor") : Color("BlueCardColor"))
                        .overlay(
                            Rectangle()
                                .stroke(Color.yellow, lineWidth: 1))
                })
            }
            
            Spacer()
            
            if buttonSelected == .chapeuzitos {
                LazyVGrid(columns: Array<GridItem>(repeating: GridItem(.flexible()), count: 2)){
                    Button(action: {
                            dog.dogHat = "frog"
                        
                    }, label: {
                        Image("frog")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                       
                        
                    })
                    .frame(height: 80)
                    Button(action: {dog.dogHat = "strawberry"}, label: {
                        Image("strawberry")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(height: 80)
                    
                    Button(action: {dog.dogHat = "crown"}, label: {
                        Image("crown")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(height: 80)
                    Button(action: {dog.dogHat = "dino"}, label: {
                        Image("dino")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(height: 80)
                    Button(action: {dog.dogHat = "witch"}, label: {
                        Image("witch")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(height: 80)
                    
                }
                .padding()
            } else {
                LazyVGrid(columns: Array<GridItem>(repeating: GridItem(.flexible()), count: 2)){
                    Button(action: {dog.dogName = "pantufa"}, label: {
                        Image("pantufa")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    })
                    .frame(height: 80)
                    Button(action: {dog.dogName = "luna"}, label: {
                        Image("luna")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(height: 80)
                    
                    Button(action: {dog.dogName = "pandora"}, label: {
                        Image("pandora")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(height: 80)
                    Button(action: {dog.dogName = "buldogue"}, label: {
                        Image("buldogue")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(height: 80)
                    Button(action: {dog.dogName = "caramelo"}, label: {
                        Image("caramelo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(height: 80)
                    
                    Button(action: {dog.dogName = "pinscher"}, label: {
                        Image("pinscher")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                    .frame(height: 80)
                    
                }
                .padding()
            }
            Spacer()
        }
        .onDisappear(){
            userDefaultsWrapper.setDog(Dog: dog)
        }
}

struct MyPetView_Previews: PreviewProvider {
    static var previews: some View {
        MyPetView(dog: (Dog.init(dogName: "pantufa", dogHat: "strawberry")))
            .environmentObject(UserDefaultsWrapper())
    }
}
}
