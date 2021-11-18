//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let times : [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        let result = times[hardness]!
        
        print(result)
    }
    
    
}
