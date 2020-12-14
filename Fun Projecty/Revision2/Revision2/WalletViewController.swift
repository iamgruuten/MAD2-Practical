//
//  WalletViewController.swift
//  Revision2
//
//  Created by Apple on 11/12/20.
//

import UIKit


let userController:UserController = UserController();

class WalletViewController: UIViewController{
    var appDelegate:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
    
    
    @IBOutlet weak var UIUserLabel: UILabel!
    @IBOutlet weak var UIAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIUserLabel.text = appDelegate.user.username;
        UIAmountLabel.text = ("$ \(String(appDelegate.user.amount))" );
        
        
    }
}
