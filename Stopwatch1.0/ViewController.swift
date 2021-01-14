//
//  ViewController.swift
//  Stopwatch1.0
//
//  Created by Swapnil on 19/04/2020.
//  Copyright © 2020 Swapnil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        timerLabel.layer.cornerRadius = 6.0
        timerLabel.layer.masksToBounds = true
        
        startButton.isEnabled = true
        startButton.layer.cornerRadius = 5.0
        startButton.layer.masksToBounds = true
        startButton.layer.cornerRadius = startButton.bounds.width / 2.0
        
        resetButton.isEnabled = false
        resetButton.layer.cornerRadius = 5.0
        resetButton.layer.masksToBounds = true
        resetButton.alpha = 0.5
        resetButton.layer.cornerRadius = resetButton.bounds.width / 2.0
        
        pauseButton.isEnabled = false
        pauseButton.layer.cornerRadius = 5.0
        pauseButton.layer.masksToBounds = true
        pauseButton.alpha = 0.5
        pauseButton.layer.cornerRadius = pauseButton.bounds.width / 2.0
        
    }


    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    
    
    @IBAction func startDidTab(_ sender: Any) {
        
        if !isTimerRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer),userInfo: nil, repeats: true)
            
            isTimerRunning = true
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
            
            pauseButton.alpha = 1.0
            resetButton.alpha = 1.0
            
            
            //timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (<#Timer#>) in
                
            }
        }
    @objc func runTimer(){
        counter += 0.1
        //timerLabel.text = "\(counter)"
        // HH:MM:SS:MSMS
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute  = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
            
        }
        let second = (flooredCounter % 3600) % 60
        
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
            
        }
        
        let decisecond = String(format: "%.1f" , counter).components(separatedBy: ".").last!
        timerLabel.text = "\(hour):\(minuteString):\(secondString):\(decisecond)"
        
    }
    
    

    @IBAction func pauseDidTab(_ sender: Any) {
        resetButton.isEnabled = true
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    
        
        startButton.alpha = 1.0
        resetButton.alpha = 1.0

        
        isTimerRunning = false
        timer.invalidate()
    }
    
    @IBAction func resetDidTab(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        timerLabel.text = "00:00:00.0"
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    
        
        pauseButton.alpha = 1.0
        startButton.alpha = 1.0
        
    }
    
}

