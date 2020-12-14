//
//  LoginViewController.swift
//  Revision2
//
//  Created by Apple on 11/12/20.
//

import UIKit


class LoginViewController:UIViewController{
    var appDelegate:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate

    let userController:UserController = UserController();

    @IBOutlet weak var passwordtxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onclick(_ sender: Any) {
        appDelegate.user = userController.RetrieveUserbyPassword(password: passwordtxt.text!)
        
        print(appDelegate.user.amount)
        print(appDelegate.user.username)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "main") as! UITabBarController
        
        nextViewController.modalPresentationStyle = .fullScreen

        self.present(nextViewController, animated:true, completion:nil)

        
    }
    
}
