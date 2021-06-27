//
//  WikiPetProgressBar.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 26/06/21.
//

import SwiftUI

struct WikiPetProgressBarView: View {
    
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { reader in
            ZStack{
                Rectangle()
                    .fill(Color("ProgressBarBackgroundColor"))
                Rectangle()
                    .fill(Color("BlueCardColor"))
                    .offset(x:  -reader.size.width * (1 - self.progress) / 2, y: 0)
                    .frame(width: reader.size.width * self.progress)

            }
        }
    }
}

struct WikiPetProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        WikiPetProgressBarView(progress: 0.5)
    }
}
