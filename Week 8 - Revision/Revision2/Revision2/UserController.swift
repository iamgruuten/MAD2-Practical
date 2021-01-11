//
//  UserController.swift
//  Revision2
//
//  Created by Apple on 11/12/20.
//

import UIKit
import CoreData

class UserController{
    var appDelegate:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
    var context:NSManagedObjectContext
    
    init() {
        context = appDelegate.persistentContainer.viewContext
    }
    
    func UserExist(username:String)->User{
        let user:User = User();
        let fetchRequestUser = NSFetchRequest<CoreDataUser>(entityName:"CoreDataUser")
        
        do{
            fetchRequestUser.predicate = NSPredicate(format: "username = %@", username)
            let data = try context.fetch(fetchRequestUser);
            
            if(data.count > 0){
                let userData = data[0]
                
                user.username = userData.username!
                user.password = userData.password!
                user.amount = userData.amount

            }
            
        }catch let error as NSError{
            print(error)
        }
        
        return user
    }
    
    func AddUser(user:User){
        //First get the recipe
        let entityUser = NSEntityDescription.entity(forEntityName: "CoreDataUser", in: context)
        
        let userObject = NSManagedObject(entity: entityUser!, insertInto: context) as! CoreDataUser
        
        userObject.setValue(user.username, forKey:"username")
        
        userObject.setValue(user.password, forKey:"password")
        userObject.setValue(user.amount, forKey:"amount")

        
        do {
            try context.save()
            print("Added User")
            
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func RetrieveUserbyPassword(password:String)->User{
        let user = User();

        let fetchRequestUser = NSFetchRequest<CoreDataUser>(entityName:"CoreDataUser")
        
        do{
            fetchRequestUser.predicate = NSPredicate(format: "password = %@", password)
            let data = try context.fetch(fetchRequestUser);
            
            if(data.count > 0){
                let userData = data[0]
                user.username = userData.username!
                user.password = userData.password!
                user.amount = userData.amount
                print(user.username)
            }
            
        }catch let error as NSError{
            print(error)
        }
        
        return user
    }
    
    //One user - Many transaction
    //One Transaction - One user
    
    func AddTransactiontoUser(user:User, t:Transaction){
                
        do{
                  
            //Deduct First
            let updateRequest = NSFetchRequest<NSManagedObject>(entityName: "CoreDataUser")
            
            updateRequest.predicate = NSPredicate(format: "username = %@", user.username)
        
            let results = try context.fetch(updateRequest)
            
            if results.count != 0 { // Atleast one was returned
                
                let item = results[0] as! CoreDataUser
                
                item.amount = item.amount - t.amount;
                
                //Add Transaction
                
                let entity = NSEntityDescription.entity(forEntityName: "CoreDataTransaction", in: context)!
                let transaction = NSManagedObject(entity: entity, insertInto: context) as! CoreDataTransaction
                
                transaction.amount = t.amount
                transaction.payee = t.payee
                transaction.date = t.date
                transaction.user = item;
                    
                try context.save()
                print("Deducted, record")
            }
            
            
        }catch let error as NSError{
            print(error)
        }

    }
    
    func RetrieveAllTransactionsbyUser(user:User)->[Transaction]{
        var transactionRetrieve:[Transaction] = [];
        
        let fetchRequestRecipe = NSFetchRequest<CoreDataUser>(entityName:"CoreDataUser")
        
        do{
            fetchRequestRecipe.predicate = NSPredicate(format: "username = %@", user.username)
            let userTransactionList = try context.fetch(fetchRequestRecipe);
            
            if(userTransactionList.count > 0){
                for item in userTransactionList {
                    
                    let transactionList = item.transactions as! Set<CoreDataTransaction>;
                    
                    for transaction in transactionList{

                        let date = Date(timeIntervalSince1970: TimeInterval(transaction.date!.timeIntervalSince1970))
                        
                        let newTransaction = Transaction(amount: transaction.amount, date: date, payee: transaction.payee!)
                        transactionRetrieve.append(newTransaction)
                    }
            }
            }
            
        }catch let error as NSError{
            print(error)
        }
        
        return transactionRetrieve
    }

}
