//
//  ChatViewController.swift
//  ParseChat
//
//  Created by David Kuchar on 5/20/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var chatMessageField: UITextField!
    
    override func viewDidLoad() {
        
        //when you want to logout:
        //dismissViewControllerAnimated(true, completion: nil)

        
    }
    
    @IBAction func onSendMessage(sender: AnyObject) {
        
        let chatMessage = chatMessageField.text
        
        var currentUser:PFUser = PFUser.currentUser()!

        var message = PFObject(className:"Message")
        message["text"] = chatMessage
        message["user"] = currentUser
        
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                println("Just sent \(chatMessage)")
            } else {
                // There was a problem, check error.description
                println("oh no! \(error)")
            }
        }
        
        
    }
}
