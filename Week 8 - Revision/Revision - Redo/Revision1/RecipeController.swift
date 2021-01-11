//
//  RecipeController.swift
//  Revision1
//
//  Created by Apple on 14/12/20.
//

import CoreData
import UIKit

class RecipeController{
    
    var appDelegate:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
    var context:NSManagedObjectContext
        
    
    init() {
        context = appDelegate.persistentContainer.viewContext
    }
    
    //Add recipe and ingredients with date and time
    func Addrecipe(recipe:Recipe){
                
        do{
                  
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
            
            fetchRequest.predicate = NSPredicate(format: "name = %@", recipe.name)
        
            let results = try context.fetch(fetchRequest)
            
            if results.count == 0 {
                
                //Add Recipe
                
                let entityRecipe = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)
                
                let recipeObject = NSManagedObject(entity: entityRecipe!, insertInto: context) as! CDRecipe
                
                recipeObject.name = recipe.name;
                recipeObject.dateTime = recipe.date;
                recipeObject.preparationTime = recipe.preparationTime;

                try context.save()
            }else{
                print("duplicate record, therefore not added")
            }
        }catch let error as NSError{
            print(error)
        }

    }
    
    //Add ingredients to recipe - Many to Many
    func addIngredientsToRecipe(recipe:Recipe, ingredient:String) {
        
        //check if got duplicate, so that can be reused to link to recipe
        let fetchIngredientRequest = NSFetchRequest<CDIngredient>(entityName: "CDIngredient")
        
        fetchIngredientRequest.predicate = NSPredicate(format: "name = %@", ingredient)
        
        do{
            let cdIngredient = try context.fetch(fetchIngredientRequest)
            
            //Get recipe object to add the ingredients in
            
            let fetchRequest = NSFetchRequest<CDRecipe>(entityName: "CDRecipe")
            fetchRequest.predicate = NSPredicate(format: "name = %@", recipe.name)
            
            let cdRecipe = try context.fetch(fetchRequest)
            let tempRecipe = cdRecipe[0]
            
            if cdIngredient.count > 0{
                //If have ingredients, then i will add in
                let tempIngredient = cdIngredient[0]
                tempIngredient.addToRecipe(tempRecipe)
            }else{
                //If dont have then, i will create new one
                let entity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)!
                let CDIngredient = NSManagedObject(entity: entity, insertInto: context) as! CDIngredient
                CDIngredient.setValue(ingredient, forKey: "name")
                print(ingredient)
                //Add to recipe
                CDIngredient.addToRecipe(tempRecipe)
                
            }
            try context.save()

        }catch let error as NSError{
            print(error)
        }
    }
    
    //retrieve ingredients
    func retrieveAllIngredients() -> [Recipe] {
        var recipeList:[Recipe] = [Recipe]();
        
        let fetchRequestRecipe = NSFetchRequest<CDRecipe>(entityName:"CDRecipe")
        
        do{
            
            let CDrecipeList = try context.fetch(fetchRequestRecipe);
            
            if(CDrecipeList.count > 0){
                for item in CDrecipeList {
                    
                    let recipe:Recipe = Recipe();
                    
                    recipe.name = item.name!
                    recipe.preparationTime = item.preparationTime
                    let date = Date(timeIntervalSince1970: TimeInterval(recipe.date.timeIntervalSince1970))

                    recipe.date = date;
                    let ingredientList = item.ingredients as! Set<CDIngredient>;
                    
                    for ingredient in ingredientList{
                        recipe.ingredientList.append(ingredient.name!)
                    }
                    
                    
                    recipeList.append(recipe)
                }
            }
            
            
        }catch let error as NSError{
            print(error)
        }
        
        return recipeList
    }
    
    //retrieve ingredients based on title
    func retrieveIngredientsbyName(name:String) -> Recipe{
        let recipe:Recipe = Recipe();
        
        let fetchRequestRecipe = NSFetchRequest<CDRecipe>(entityName:"CDRecipe")
        
        do{
            fetchRequestRecipe.predicate = NSPredicate(format: "name = %@", name)
            let RecipeIngredientList = try context.fetch(fetchRequestRecipe);
            
            if(RecipeIngredientList.count > 0){
                for item in RecipeIngredientList {
                    
                    let ingredientsList = item.ingredients as! Set<CDIngredient>;
                    
                    for ingredient in ingredientsList{
                        recipe.ingredientList.append(ingredient.name!)
                    }
            }
            }
            
        }catch let error as NSError{
            print(error)
        }
        
        return recipe;
    }

    
}
