//
//  AddRecipeViewController.swift
//  Revision
//
//  Created by Apple on 8/12/20.
//

import UIKit
import CoreData


class AddRecipeViewController : UIViewController{
    
    let recipeController:RecipeController = RecipeController();
    
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtIngredient1: UITextField!
    
    @IBOutlet weak var txtIngredient2: UITextField!
    
    @IBOutlet weak var txtIngredient3: UITextField!
    
    @IBOutlet weak var txtIngredient4: UITextField!
    
    @IBOutlet weak var txtIngredient5: UITextField!
    
    @IBAction func clickadd(_ sender: Any) {
        if !txtTitle.hasText || !txtPreparationTime.hasText {
            // create the alert
            let alert = UIAlertController(title: "UIAlertController", message: "Please populate the title and preparation time.", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }else{
            
            if !txtIngredient1.hasText && !txtIngredient2.hasText && !txtIngredient3.hasText &&
                !txtIngredient4.hasText &&
                !txtIngredient5.hasText{
                
                let alert = UIAlertController(title: "UIAlertController", message: "Please populate at least 1 ingredient", preferredStyle: UIAlertController.Style.alert)
                
                // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            }else{
                var arrayIngredient = [String]()
                let recipe:Recipe = Recipe();
                
                if(txtIngredient1.hasText){
                    arrayIngredient.append(txtIngredient1.text!)
                }
                if(txtIngredient2.hasText){
                    arrayIngredient.append(txtIngredient2.text!)
                }
                if(txtIngredient3.hasText){
                    arrayIngredient.append(txtIngredient3.text!)
                }
                if(txtIngredient4.hasText){
                    arrayIngredient.append(txtIngredient4.text!)
                }
                if(txtIngredient5.hasText){
                    arrayIngredient.append(txtIngredient5.text!)
                }
                
                
                recipe.productName = txtTitle.text!;
                recipe.preparationTime = Int16(txtPreparationTime.text!)!;
                
                recipeController.addRecipe(newRecipe: recipe)
                
                for ingredient in arrayIngredient{
                    print(ingredient)
                    recipeController.addIngredientToRecipe(recipe: recipe, ingredient: ingredient)
                }
                
                let alert = UIAlertController(title: "UIAlertController", message: "Added Successfully", preferredStyle: UIAlertController.Style.alert)
                
                // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler:
                                                {_ in
                                                    self.navigationController?.popViewController(animated: true)
                                                    
                                                }))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
                
            }
        }
    }
    
    
    
}
