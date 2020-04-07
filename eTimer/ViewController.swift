//
//  ViewController.swift
//  eTimer
//
//  Created by Marina Svistkova on 07.04.2020.
//  Copyright © 2020 Marina Svistkova. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        progressBar.progress = 0.0
    }
    @IBAction func hardnessSelected(_ sender: UIButton){

        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime  = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
        
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            

        } else {
        timer.invalidate()
            titleLabel.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
    }
}
