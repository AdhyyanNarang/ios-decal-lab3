//
//  ViewController.swift
//  Stopwatch
//
//  Created by Adhyyan Narang on 2/16/17.
//  Copyright © 2017 Adhyyan Narang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var stopwatch = Stopwatch()
    var time = Timer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(timer: Timer) {
        let minutes = -stopwatch.dateObj.timeIntervalSinceNow/60
        let seconds = -stopwatch.dateObj.timeIntervalSinceNow.truncatingRemainder(dividingBy: 60)
        let milli = -stopwatch.dateObj.timeIntervalSinceNow.truncatingRemainder(dividingBy: 1) * 100
        let timeString = String(format: "%02d:%02d.%02d", Int(minutes), Int(seconds), Int(milli))
        updateLabel.text = timeString
}
    
    @IBAction func startClicked(_ sender: UIButton) {
        stopwatch.dateObj = Date();
        time = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                             selector: #selector(self.update),
                             userInfo: nil,
                             repeats: true)
    }
    
    @IBAction func stopClicked(_ sender: UIButton) {
        time.invalidate()
        let timeString = String(format: "%02d:%02d.%02d", 0 , 0 , 0)
        updateLabel.text = timeString
    }
    @IBOutlet weak var updateLabel: UILabel!
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var stop: UIButton!
}


