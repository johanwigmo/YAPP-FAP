//
//  CallbackViewController.swift
//  15 Communication
//
//  Created by Johan Wigmo on 2019-01-15.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

typealias DateBlock = ((Date) -> Void)

class CallbackViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    let myTimer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTimer.callback = { date in
            self.label.text = "\(date)"
        }
        
    }
    
    @IBAction func start(_ sender: Any) {
        myTimer.start()
    }
    
    @IBAction func stop(_ sender: Any) {
        myTimer.stop()
    }

}

class MyTimer {
    
    var timer: Timer?
    
    var callback: DateBlock?
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.callback?(timer.fireDate)
        })
        timer?.fire()
    }
    
    func stop() {
        timer?.invalidate()
    }
    
}
