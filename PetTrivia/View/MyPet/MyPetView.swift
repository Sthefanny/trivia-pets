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
                    Image("dogImageBackgroundYellow")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    Image("\(dog.dogName)_\(dog.dogHat)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image("\(dog.dogHat)_\(dog.dogName)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(70)
               
            }
            .frame(maxHeight: 200)
            Spacer()
            
            Text("Meu Pet")
                .font(Font.custom("HelveticaNeue", size: 40))
                .fontWeight(.medium)
                .foregroundColor(Color("BlueTextColor"))
            
            // MARK: nagivation dog vs hats
            
            HStack{
                Picker(selection: $buttonSelected, label: Text("What is your favorite color?")) {
                    Text("Doguitos").tag(ButtonSelected.doguitos)
                    Text("Chapeuzitos").tag(ButtonSelected.chapeuzitos)
                        
               }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color("YellowCircleColor").opacity(1))
                .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .cornerRadius(5)
                .padding(.horizontal)
            }


            
            // MARK: hats and dogs card
            if buttonSelected == .chapeuzitos {
                VStack {
                    Spacer()
                    HStack (alignment: .bottom){
                        Button(action: {dog.dogHat = "witch"}, label: {
                            Image("witch")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(height: 130)

                        Button(action: {
                                dog.dogHat = "crown"
                            
                        }, label: {
                            Image("crown")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(width: 140)
 
                    }
                    Spacer()
                    HStack{
                        Button(action: {dog.dogHat = "dino"}, label: {
                            Image("dino")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(height: 100)
                        Button(action: {dog.dogHat = "frog"}, label: {
                            Image("frog")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(height: 100)
                        
                        Button(action: {dog.dogHat = "strawberry"}, label: {
                            Image("strawberry")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(height: 100)
                    }
                    
                    Spacer()
                    
          
                    
                 
                }
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height * 0.5)
                .padding(10)

            } else {
                
                VStack{
                    Spacer()
                    HStack{
                        Button(action: {dog.dogName = "pantufa"}, label: {
                            Image("pantufa")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        })
                        .frame(height: 100)
                        Button(action: {dog.dogName = "luna"}, label: {
                            Image("luna")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(height: 100)
                        
                        Button(action: {dog.dogName = "pandora"}, label: {
                            Image("pandora")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(height: 100)
                    }
                   Spacer()
                    HStack{
                        Button(action: {dog.dogName = "buldogue"}, label: {
                            Image("buldogue")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(height: 100)
                        Button(action: {dog.dogName = "caramelo"}, label: {
                            Image("caramelo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(height: 100)
                        
                        Button(action: {dog.dogName = "pinscher"}, label: {
                            Image("pinscher")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        .frame(height: 100)
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height * 0.5)
                .padding(10)
            }
            Spacer()
        }
        .onDisappear(){
            userDefaultsWrapper.setDog(Dog: dog)
        }
        .background(Color("BackgroundColor")
                        .ignoresSafeArea())
}

struct MyPetView_Previews: PreviewProvider {
    static var previews: some View {
        MyPetView(dog: (Dog.init(dogName: "pantufa", dogHat: "strawberry")))
            .environmentObject(UserDefaultsWrapper())
    }
}
}
