//
//  ViewController.swift
//  Practice
//
//  Created by Apple on 27/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appleText: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        appleText.text = "Jason Handsome"
        if(textField.hasText){
            appleText.text = "Hello world"
        }
        
        
    }
    
    
    
    

}

