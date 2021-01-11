//
//  AddRecipeViewController.swift
//  Revision1
//
//  Created by Apple on 14/12/20.
//

import UIKit
import CoreData


class AddRecipeViewController : UIViewController, UITextFieldDelegate{
    
    let recipeController:RecipeController = RecipeController();

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var txtIngredient1: UITextField!
    @IBOutlet weak var txtIngredient2: UITextField!
    @IBOutlet weak var txtIngredient3: UITextField!
    @IBOutlet weak var txtIngredient4: UITextField!
    @IBOutlet weak var txtIngredient5: UITextField!
    
    var ingredient1:String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtTitle.delegate = self
        txtPreparationTime.delegate = self
        txtIngredient1.delegate = self
        txtIngredient2.delegate = self
        txtIngredient3.delegate = self
        txtIngredient4.delegate = self
        txtIngredient5.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func btnAdd(_ sender: Any) {
        let recipeTitle:String;
        let preparationtime:String;
        
        if(txtTitle.hasText && txtPreparationTime.hasText){
            
            var ingredientList:[Ingredient] = [];
            
            if(txtIngredient1.hasText){
                let ingredient:Ingredient = Ingredient();
                ingredient.name = txtIngredient1.text!;
                ingredientList.append(ingredient);
            }
            
            if(txtIngredient2.hasText){
                let ingredient:Ingredient = Ingredient();
                ingredient.name = txtIngredient2.text!;
                ingredientList.append(ingredient);
            }
            
            if(txtIngredient3.hasText){
                let ingredient:Ingredient = Ingredient();
                ingredient.name = txtIngredient3.text!;
                ingredientList.append(ingredient);
            }
            
            if(txtIngredient4.hasText){
                let ingredient:Ingredient = Ingredient();
                ingredient.name = txtIngredient4.text!;
                ingredientList.append(ingredient);
            }
            
            if(txtIngredient5.hasText){
                let ingredient:Ingredient = Ingredient();
                ingredient.name = txtIngredient5.text!;
                ingredientList.append(ingredient);
            }
            
            if(!ingredientList.isEmpty){
                
                recipeTitle = txtTitle.text!;
                preparationtime = txtPreparationTime.text!;
                
                let recipe:Recipe = Recipe();
                
                recipe.name = recipeTitle;
                recipe.preparationTime = Int16(preparationtime)!;
                recipe.date = Date();
                                
                recipeController.Addrecipe(recipe: recipe);
                print(ingredientList)
                for ingredientItem in ingredientList {
                    recipeController.addIngredientsToRecipe(recipe: recipe, ingredient: ingredientItem.name)
                    
                    
                }
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                  let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tableVIew") as! UITableViewController
                  
                  nextViewController.modalPresentationStyle = .fullScreen

                  self.present(nextViewController, animated:true, completion:nil)

            }else{
                
                    
                    // create the alert
                            let alert = UIAlertController(title: "Empty Field", message: "Please enter at least one ingredient", preferredStyle: UIAlertController.Style.alert)

                            // add the actions (buttons)
                            alert.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: nil))
                    
                            // show the alert
                            self.present(alert, animated: true, completion: nil)
            }
        }else{
            
            // create the alert
                    let alert = UIAlertController(title: "Empty Field", message: "Please populate the title and preparation time.", preferredStyle: UIAlertController.Style.alert)

                    // add the actions (buttons)
                    alert.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: nil))
            
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
    }
}
