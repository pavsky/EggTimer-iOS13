//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

var shouldTimerRun : Bool = false
var secondsLeft : Int = 60
var totalTime : Int = 60
var mytimer = Timer()

func runTimer() {
    if shouldTimerRun == true {
        print("seconds left = \(secondsLeft)")
        secondsLeft -= 1
    } else {
        print("This time does not work.")
    }
    
    if (secondsLeft == 0) {
        print("Timer stopped!")
        shouldTimerRun = false
        mytimer.invalidate()
    }
    
}

class ViewController: UIViewController {
    
    let times : [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    

    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        let result = times[hardness]!
        
        print(result)
        if shouldTimerRun == true {
            print("clock already running.")
        } else {
            runResult(myresult: result)
        }
    }
    
    func runResult(myresult:Int) {
        shouldTimerRun = true
        let result = myresult
        switch result {
        case 5:
            secondsLeft = 10
            totalTime = 10
            break
        case 7:
            secondsLeft = 20
            totalTime = 20
            break
        case 12:
            secondsLeft = 30
            totalTime = 30
            break
        default:
            print("Default action ran")
            break
        }
        mytimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: shouldTimerRun) { [self] timer in
            runTimer()
            if secondsLeft > 0 {
            let xt = totalTime / 10
            let secondsToGo = Float((totalTime - secondsLeft) / xt)
                progressBar.progress = Float(secondsToGo) / 10
                print(secondsToGo)
            } else {
                progressBar.progress = 1.0
            }
        }
    }
    
}
