//
//  NotificationViewController.swift
//  NotificationExtension
//
//  Created by apple on 29/04/19.
//  Copyright © 2019 appsmall. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = #imageLiteral(resourceName: "Aladdin-Thinking-GIF.gif")
    }
    
    func didReceive(_ notification: UNNotification) {
        
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
       
        // Show image on imageView on the basis of action
        switch response.actionIdentifier {
        case "answerOne":
            imageView.image = #imageLiteral(resourceName: "Aladdin-Thinking-GIF.gif")
            
        case "answerTwo":
            imageView.image = #imageLiteral(resourceName: "759.gif")
            
        case "clue":
            let alert = UIAlertController(title: "Hint", message: "The answer is greater than 29", preferredStyle: .alert)
            let action = UIAlertAction(title: "Thanks!", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        default :
            break
            
        }
        
        completion(.doNotDismiss)
    }

}
