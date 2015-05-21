//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Justin Aschenbener on 5/20/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        
        // Do any additional setup after loading the view.
        PFUser.logInWithUsernameInBackground(emailField.text, password:passwordField.text) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                NSLog("successful login with parse")
            } else {
                // The login failed. Check error to see why.
                NSLog("failure on login with parse")
            }
        }
        
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        
        var user = PFUser()
        user.username = emailField.text
        user.password = passwordField.text
        user.email = emailField.text
        // other fields can be set just like with PFObject
//        user["phone"] = "440-503-0535"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
                NSLog("error signing up with parse \(errorString)")
            } else {
                // Hooray! Let them use the app now.
                NSLog("success sign up with parse")
            }
        }
        
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
