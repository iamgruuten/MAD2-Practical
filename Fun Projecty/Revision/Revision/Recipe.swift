//
//  Recipe.swift
//  Revision
//
//  Created by Apple on 9/12/20.
//

import UIKit

class Recipe{
    var productName:String;
    var ingredients:[String];
    var preparationTime:Int16;
    
    init(){
        productName = "";
        ingredients = [];
        preparationTime = 0;
    }
    func Recipe(productName:String, ingredients:[String], preparationTime:Int16){
        self.productName = productName;
        self.ingredients = ingredients;
        self.preparationTime = preparationTime;
    }
}
