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
        
        let person:Contact = appDelegate.contactList[itemIndex];
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
        appDelegate.contactList[itemIndex].firstName = String(UIFstNameField.text!);
        appDelegate.contactList[itemIndex].lastName = String(UILstNameField.text!);
        appDelegate.contactList[itemIndex].mobileNo = String(UIMobileField.text!);
        
        print("updated successful")
        updateContactControllerDelegate?.didSendMessage("Updated");
                
        buttonCancel.sendActions(for: .touchUpInside)
        
   

    }
}
