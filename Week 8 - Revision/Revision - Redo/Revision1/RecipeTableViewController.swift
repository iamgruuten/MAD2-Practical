//
//  RecipeTableViewController.swift
//  Revision1
//
//  Created by Apple on 14/12/20.
//

import UIKit

class RecipeTableViewController : UITableViewController{
    var appDelegate:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate

    let recipeController:RecipeController = RecipeController();
    var recipeList:[Recipe] = [Recipe]();
    
    override func viewDidLoad(){
        super.viewDidLoad();
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths[0])

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recipeList = recipeController.retrieveAllIngredients();
        
        self.tableView.reloadData();
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let recipe = recipeList[indexPath.row]
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yyyy hh:mm"
        let myString = formatter.string(from: recipe.date)

        cell.textLabel!.text = "\(recipe.name)"

        cell.detailTextLabel!.text = "\(myString)"

        return cell;
    }
}
