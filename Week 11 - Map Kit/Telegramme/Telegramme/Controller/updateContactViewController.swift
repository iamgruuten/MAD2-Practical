//
//  updateContactViewController.swift
//  Telegramme
//
//  Created by Apple on 14/11/20.
//

import UIKit

protocol updateContactDelegate {
    func didSendMessage(_ cookie: String)
}

class updateContactController: UIViewController{
    
    let contactController:ContactController = ContactController();
    
    @IBOutlet weak var UIFstNameField: UITextField!
    @IBOutlet weak var UILstNameField: UITextField!
    @IBOutlet weak var UIMobileField: UITextField!
    var itemIndex: Int = 0;
    @IBOutlet weak var buttonCancel: UIButton!
    
    var updateContactControllerDelegate :updateContactDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateContact(itemIndex: Int){
        
        let person:Contact = (contactController.retrieveContact()?[itemIndex])!;
        UIFstNameField.text = person.firstName;
        UILstNameField.text = person.lastName;
        UIMobileField.text = person.mobileNo;
        self.itemIndex = itemIndex;
        
    }
    
    @IBAction func btnCancwl(_ sender: Any) {
        print("Cancel button pressed");
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        //Update Button
        let contact:Contact = Contact(firstname: String(UIFstNameField.text!), lastname: String(UILstNameField.text!), mobileno: String(UIMobileField.text!))
        
        contactController.updateContact(mobileno: String(UIMobileField.text!), newContact: contact)
        
        
        print("updated successful")
        updateContactControllerDelegate?.didSendMessage("Updated");
                
        buttonCancel.sendActions(for: .touchUpInside)
        
   

    }
}
