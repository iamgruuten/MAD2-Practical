//
//  AddContantViewController.swift
//  Telegramme
//
//  Created by Apple on 12/11/20.
//

import UIKit

class AddContactViewController:UIViewController {
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = "";
        lastNameFld.text = "";
        mobileFld.text = "";
        
    }
    
    @IBAction func createBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        
        var firstName:String = firstNameFld.text!
        var lastName:String = lastNameFld.text!
        var mobile:String = mobileFld.text!
        
        print(String(appDelegate.contactList.count))
        let newContact = Contact(firstname: firstName, lastname: lastName, mobileno: mobile)
        appDelegate.contactList.append(newContact);
    }
    
    
}


