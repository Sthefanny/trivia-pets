//
//  HomeView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 18/06/21.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    
    @State var isGamePresented = false
    @State var player: AVAudioPlayer?
    @State var isAnimatingDog = false
    
    @EnvironmentObject var userDefaultsWrapper: UserDefaultsWrapper
    
    let showWiki: () -> Void
    
    let showPreGame: () -> Void
    
    
    
    func setInitialData() {

        
        let possibleCategories = UserDefaultsWrapper.fetchPossibleCategories()
        
        if possibleCategories == nil {
            UserDefaultsWrapper.setPossibleCategories(categories: [
                Category(id: 3, text: QuestionCategory.environmentalEnrichment.rawValue),
                Category(id: 2, text: QuestionCategory.allowedFood.rawValue),
                Category(id: 1, text: QuestionCategory.naturalDiet.rawValue),
                Category(id: 0, text: QuestionCategory.allOptions.rawValue)
            ])
        }
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                self.makeView()
        }
        .onAppear {
            self.setInitialData()
        }
    }
    
    func makeView() -> some View {

            return VStack(alignment: .center) {
                Spacer()
                VStack{
                    Image("petizLogoHorizontal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 50)
                    Image("\(userDefaultsWrapper.dog.dogName)_\(userDefaultsWrapper.dog.dogHat)Hat")
                        .resizable()
                        .padding(.top, -20)
                    
                }
                .aspectRatio(contentMode: .fit)
                .onTapGesture(count: 2, perform: {
                    isAnimatingDog = true
                    AudioHelper.playSound(audioName: "dogBarking.wav")
                })
                Button(action: {
                    UserDefaultsWrapper.clearData()
                }) {
                    Text("Apagar dados")
                }

                HStack {
                    CardView(imageName: "playCardImage", title: "Jogar", bgColorName: "YellowCardColor")
                        .onTapGesture {
                            AudioHelper.playSound(audioName: "button.wav")
                            showPreGame()
                        }
                    
                    CardView(imageName: "wikiPetCardImage", title: "WikiPet", bgColorName: "YellowCardColor")
                        .onTapGesture {
                            AudioHelper.playSound(audioName: "button.wav")
                            showWiki()
                        }
                }
//                Spacer()
                HStack {
                    CardView(imageName: "accessoriesCardImage", title: "Acessórios", bgColorName: "YellowCardColor", isEnabled: false)
                    CardView(imageName: "snacksCardImage", title: "Petiscos", bgColorName: "YellowCardColor", isEnabled: false)
                }
//                Spacer()
            }
            .padding()
            .fullScreenCover(
                isPresented: $isGamePresented,
                content: { SortView() }
            )
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView (){
            
            
        } showPreGame: {
            
        }
    .environmentObject(UserDefaultsWrapper())

    }
}

import SwiftUI

struct ImageAnimated: UIViewRepresentable {
    let imageSize: CGSize
    let imageNames: [String]
    let duration: Double = 0.5

    func makeUIView(context: Self.Context) -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0
            , width: imageSize.width, height: imageSize.height))

        let animationImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))

        animationImageView.clipsToBounds = true
        animationImageView.layer.cornerRadius = 5
        animationImageView.autoresizesSubviews = true
        animationImageView.contentMode = UIView.ContentMode.scaleAspectFill

        var images = [UIImage]()
        imageNames.forEach { imageName in
            if let img = UIImage(named: imageName) {
                images.append(img)
            }
        }

        animationImageView.image = UIImage.animatedImage(with: images, duration: duration)

        containerView.addSubview(animationImageView)

        return containerView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ImageAnimated>) {

    }
}

