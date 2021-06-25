//
//  HomeView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 18/06/21.
//

import SwiftUI

struct HomeView: View {
    //@State var frame: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
   //         HStack {
        //        GeometryReader { (geometry) in
                    self.makeView()
          //      }
           // }
        }
    }
    
    func makeView() -> some View {
        //    print(geometry.size.width, geometry.size.height)

      //      DispatchQueue.main.async { self.frame = geometry.size }

            return VStack(alignment: .center) {
              //  Spacer()
                Image("dogTitleImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.padding(.all)

                   // .frame(width: geometry.size.width)
            Spacer()
            Spacer()
                HStack {
                    CardView(imageName: "playCardImage", title: "Jogar", bgColorName: "YellowCardColor")
                       
                    CardView(imageName: "wikiPetCardImage", title: "WikiPet", bgColorName: "YellowCardColor")
                }
                //.padding(.horizontal)
                Spacer()
                HStack {
                    CardView(imageName: "accessoriesCardImage", title: "Acessórios", bgColorName: "YellowCardColor", isEnabled: false)
                    CardView(imageName: "snacksCardImage", title: "Petiscos", bgColorName: "YellowCardColor", isEnabled: false)
                }
                Spacer()
                //.padding(.horizontal)
            }
            .padding()
            //.frame(width: geometry.size.width)
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

