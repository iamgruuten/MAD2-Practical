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
    let contactController:ContactController = ContactController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = "";
        lastNameFld.text = "";
        mobileFld.text = "";
        
    }
    
    @IBAction func createButton(_ sender: Any) {
        let contact:Contact = Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
        contactController.AddContact(newContact: contact)
 
    }
}


