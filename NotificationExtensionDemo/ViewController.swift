//
//  ViewController.swift
//  NotificationExtensionDemo
//
//  Created by apple on 29/04/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func scheduleNotificationBtnPressed(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "Subtitle"
        content.body = "Body"
        content.badge = 1
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "myNotificationCategory"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2.0, repeats: false)
        
        let requestIdentifier = "africaQuiz"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let err = error {
                print("Error : \(err.localizedDescription)")
            }
            
            print("No Error")
        }
    }
}


// MARK:- NOTIFICATION CENTER DELEGATE METHODS
extension ViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
}
