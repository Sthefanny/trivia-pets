//
//  AudioHelper.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 30/06/21.
//

import Foundation
import AVFoundation

class AudioHelper {
    public static var player: AVAudioPlayer?

    public static func playSound(audioName: String) {
        guard let url = Bundle.main.url(forResource: audioName, withExtension: "") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            player?.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
