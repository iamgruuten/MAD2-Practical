//
//  RecipeTableViewController.swift
//  Revision
//
//  Created by Apple on 8/12/20.
//

import UIKit
import CoreData


var recipeList:[Recipe] = [Recipe]();

class RecipeTableViewController : UITableViewController{
    let recipeController:RecipeController = RecipeController();

    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad();
        
        recipeList = recipeController.retrieveData()
        
        
    }
    
        override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // create the alert
        let alert = UIAlertController(title: "Delete " + recipeList[indexPath.row].productName, message: "Are you sure you want to delete?", preferredStyle: UIAlertController.Style.alert)

                // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler: {_ in
            
            self.recipeController.deleteData(recipeName:recipeList[indexPath.row].productName)
            recipeList.remove(at: indexPath.row)

            self.tableView.reloadData()
            
        }))
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        
        let recipe = recipeList[indexPath.row]
        

        
        cell.textLabel!.text = "\(recipe.productName) ( \(recipe.preparationTime) )"
        
        cell.detailTextLabel!.text = "Ingredients: \(recipe.ingredients)"
        
        return cell;
    }
}
