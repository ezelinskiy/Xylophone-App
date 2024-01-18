//
//  ViewController.swift
//  Xylophone App
//
//  Created by Evgeniy Zelinskiy on 17.01.2024.
//

import UIKit
import AVFoundation

class XylophoneButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 15
    }
}

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    @IBAction func onKeyPressed(_ sender: UIButton) {
        playSoundWith(name: sender.currentTitle ?? "A")
        sender.alpha = 0.7
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSoundWith(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

