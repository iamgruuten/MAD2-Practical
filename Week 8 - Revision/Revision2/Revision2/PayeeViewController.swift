//
//  PayeeViewController.swift
//  Revision2
//
//  Created by Apple on 11/12/20.
//

import UIKit


class PayeeViewController:UIViewController{
    let userController:UserController = UserController();
    
    @IBOutlet weak var payAmount: UITextField!
    @IBOutlet weak var payee: UITextField!
    var appDelegate:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnConfirm(_ sender: Any) {
        let amount:Double = Double(payAmount.text!)!
        let assignPayee = payee.text;
        
        let currentDateTime = NSDate();
        
        if(appDelegate.user.amount < amount){
            let alertInsufficient = UIAlertController(title: "Wallet", message: "Your wallet does not have enough fund. Please top up your wallet", preferredStyle: UIAlertController.Style.alert)
            
            
            alertInsufficient.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: nil))
            
            
            self.present(alertInsufficient, animated: true, completion: nil)
        }else{
            
            let transaction = Transaction(amount: amount, date: currentDateTime as Date, payee: assignPayee!)
                        
            let alert = UIAlertController(title: "Confirm Deduction", message: "Deduct from your wallet", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Submit", style: UIAlertAction.Style.default, handler:
                                            { _ in
                                                self.userController.AddTransactiontoUser(user: self.appDelegate.user, t: transaction)
                                            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
