//
//  NotificationsViewController.swift
//  15 Communication
//
//  Created by Johan Wigmo on 2019-01-15.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    let myTimer = MyNotificationTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel(_:)), name: MyNotificationTimer.notificationName, object: nil)
    }
    
    @objc func updateLabel(_ notification: Notification) {
        guard let date = notification.object as? Date else { return }
        label.text = "\(date)"
    }
    
    @IBAction func start(_ sender: Any) {
        myTimer.start()
    }
    
    @IBAction func stop(_ sender: Any) {
        myTimer.stop()
    }
    
}

class MyNotificationTimer {
    
    var timer: Timer?
    
    static let notificationName = Notification.Name("timer_notification")
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            let notification = Notification(name: MyNotificationTimer.notificationName, object: timer.fireDate, userInfo: nil)
            NotificationCenter.default.post(notification)
        })
        timer?.fire()
    }
    
    func stop() {
        timer?.invalidate()
    }
    
}
