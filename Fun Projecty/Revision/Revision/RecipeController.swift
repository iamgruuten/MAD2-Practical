//
//  RecipeController.swift
//  Revision
//
//  Created by Apple on 10/12/20.
//

import UIKit
import CoreData

class RecipeController{
    
    var appDelegate:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
    var context:NSManagedObjectContext
    
    init() {
        context = appDelegate.persistentContainer.viewContext
    }
    
    
    //Add Data
    func addRecipe(newRecipe:Recipe){
        
        //First get the recipe
        let entityRecipe = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)
        
        let recipe = NSManagedObject(entity: entityRecipe!, insertInto: context) as! CDRecipe
        
        recipe.setValue(newRecipe.productName, forKey:"name")
        
        recipe.setValue(newRecipe.preparationTime, forKey:"preparationTime")
        
        do {
            try context.save()
            print("Added")
            
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    //Add data to recipe
    func addIngredientToRecipe(recipe:Recipe, ingredient:String) {
        let fetchIngredientRequest = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        
        fetchIngredientRequest.predicate = NSPredicate(format: "name = %@", ingredient)
        
        do{
            let cdIngredient = try context.fetch(fetchIngredientRequest)
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
            fetchRequest.predicate = NSPredicate(format: "name = %@", recipe.productName)
            
            let cdRecipe = try context.fetch(fetchRequest)
            let tempRecipe = cdRecipe[0] as! CDRecipe
            
            if cdIngredient.count > 0{
                let tempIngredient = cdIngredient[0] as! CDIngredient
                tempIngredient.addToRecipes(tempRecipe)
            }else{
                let entity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)!
                let CDIngredient = NSManagedObject(entity: entity, insertInto: context) as! CDIngredient
                
                CDIngredient.setValue(ingredient, forKey: "name")
                CDIngredient.addToRecipes(tempRecipe)
                
            }
            try context.save()

        }catch let error as NSError{
            print(error)
        }
    }
    
    
    //Retrieve Data
    func retrieveData()->[Recipe]{
        var recipeList:[Recipe] = [Recipe]();
        
        let fetchRequestRecipe = NSFetchRequest<CDRecipe>(entityName:"CDRecipe")
        
        do{
            
            let CDrecipeList = try context.fetch(fetchRequestRecipe);
            
            if(CDrecipeList.count > 0){
                for item in CDrecipeList {
                    
                    let recipe:Recipe = Recipe();
                    
                    recipe.productName = item.name!
                    recipe.preparationTime = item.preparationTime
                    
                    let ingredientList = item.ingredients as! Set<CDIngredient>;
                    
                    for ingredient in ingredientList{
                        recipe.ingredients.append(ingredient.name!)
                    }
                    
                    
                    recipeList.append(recipe)
                }
            }
            
            
        }catch let error as NSError{
            print(error)
        }
        
        return recipeList
    }
    
    //Retrieve Data based on product name
    func retrieveData(recipeName:String)->Recipe{
        let recipe:Recipe = Recipe();
        
        let fetchRequestRecipe = NSFetchRequest<CDRecipe>(entityName:"CDRecipe")
        
        do{
            fetchRequestRecipe.predicate = NSPredicate(format: "name = %@", recipeName)
            let CDrecipeList = try context.fetch(fetchRequestRecipe);
            
            if(CDrecipeList.count > 0){
                for item in CDrecipeList {
                    
                    let recipe:Recipe = Recipe();
                    
                    recipe.productName = item.name!
                    recipe.preparationTime = item.preparationTime
                    
                    let ingredientList = item.ingredients as! Set<CDIngredient>;
                    
                    for ingredient in ingredientList{
                        recipe.ingredients.append(ingredient.name!)
                    }
                    
            }
            }
            
        }catch let error as NSError{
            print(error)
        }
        
        return recipe
    }
    
    
    //Delete Data
    func deleteData(recipeName:String){
        let fetchRequest = NSFetchRequest<CDRecipe>(entityName: "CDRecipe")
        fetchRequest.predicate = NSPredicate(format: "name = %@", recipeName)
        
        do{
            let results = try context.fetch(fetchRequest)
            
            let r = results[0]
            r.removeFromIngredients(r.ingredients!)
            
            context.delete(r)
            
            try context.save()
            
            
        }catch {
            print("Fetch Failed: \(error)")
        }
    }
    
    //Edit data
    func editData(recipeName:String){
        
    }
}

