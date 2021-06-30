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
    
    let showWiki: () -> Void
    
    let showPreGame: () -> Void
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                self.makeView()
        }
    }
    

    func playSound() {
        guard let url = Bundle.main.url(forResource: "dogBarking", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            player?.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    var animatedDog: some View {
        ImageAnimated(
            imageSize: UIImage(named: "TitleImage")!.size, imageNames: ["TitleImage", "TitleImage2", "TitleImage3"])
    }
    
    func makeView() -> some View {

            return VStack(alignment: .center) {
                Spacer()
                Button(action: {
                    isAnimatingDog = true
                    playSound()
                }, label: {
                    Group{
                        Image("TitleImage")
                            .resizable()
                    }
                    .aspectRatio(contentMode: .fit)
                })
                Button(action: {
                    UserDefaultsWrapper.clearData()
                }) {
                    Text("Apagar dados")
                }

                HStack {
                    CardView(imageName: "playCardImage", title: "Jogar", bgColorName: "YellowCardColor")
                        .onTapGesture {
                            showPreGame()
                        }
                    
                    CardView(imageName: "wikiPetCardImage", title: "WikiPet", bgColorName: "YellowCardColor")
                        .onTapGesture {
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
        HomeView {
        
        } showPreGame: {
            
        }

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

