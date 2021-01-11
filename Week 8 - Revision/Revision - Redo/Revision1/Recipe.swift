//
//  Ingredients.swift
//  Revision1
//
//  Created by Apple on 14/12/20.
//

import UIKit

class Ingredients{
    let name:String;
    let preparationTime:Int16;
    
    init(name:String, preparationTime:Int16) {
        self.name = name;
        self.preparationTime = preparationTime;
    }
    
    init(){
        name = "";
        preparationTime = 0;
    }
}
