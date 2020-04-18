//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 7, "Hard": 12]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func softnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 1
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0;
        secondsPassed = 0
        label1.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let progress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = Float(progress)
        } else {
            timer.invalidate()
            label1.text = "DONE!"
        }
    }
    
}
