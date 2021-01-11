//
//  Ingredients.swift
//  Revision1
//
//  Created by Apple on 14/12/20.
//

import UIKit

class Recipe{
    var name:String;
    var preparationTime:Int16;
    var date:Date;
    var ingredientList:[String];
    
    init(name:String, preparationTime:Int16, ingredientList:[String], date:Date) {
        self.name = name;
        self.preparationTime = preparationTime;
        self.ingredientList = ingredientList;
        self.date = date;
    }
    
    init(){
        name = "";
        preparationTime = 0;
        date = Date();
        ingredientList = [];
    }
}
