//
//  ViewController.swift
//  Practical3
//
//  Created by Apple on 4/11/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myLbl: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func onClick(_ sender: Any) {
        print("I am clicked")
        myLbl.text = "Button has been clicked"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        txtField.resignFirstResponder()
        myLbl.text = textField.text
        return true
        
    }
    
    

}

