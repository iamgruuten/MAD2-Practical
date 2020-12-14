//
//  Transaction.swift
//  Revision2
//
//  Created by Apple on 11/12/20.
//

import UIKit

class Transaction{
    var amount:Double;
    var date:Date;
    var payee:String;
    
    init (amount:Double, date:Date, payee:String) {
        self.amount = amount;
        self.date = date;
        self.payee = payee;
        
    }
    
}
