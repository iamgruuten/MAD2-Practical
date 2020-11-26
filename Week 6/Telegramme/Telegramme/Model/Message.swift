//
//  Message.swift
//  Telegramme
//
//  Created by Apple on 26/11/20.
//

import UIKit

class Message{
    var date:Date;
    var isSender:Bool;
    var text:String;

    init(date:Date, isSender:Bool, text:String) {
        self.date = date;
        self.isSender = isSender;
        self.text = text;
    }
    
    
}
