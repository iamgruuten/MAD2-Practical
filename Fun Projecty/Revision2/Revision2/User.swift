//
//  User.swift
//  Revision2
//
//  Created by Apple on 11/12/20.
//

import UIKit

class User{
    var username:String;
    var password:String;
    var amount:Double;
    
    init (username:String, password:String, amount:Double){
        self.username = username;
        self.password = password;
        self.amount = amount;
    }
    
    init(){
        self.username = ""
        self.password = ""
        self.amount = 0.0
    }
}
