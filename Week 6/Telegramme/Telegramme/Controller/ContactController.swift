//
//  ContactController.swift
//  Telegramme
//
//  Created by Apple on 25/11/20.
//

import UIKit
import CoreData

class ContactController{
    
    
    var appDelegate:AppDelegate
    var context:NSManagedObjectContext
    
    init() {
        context = appDelegate.persistentContainer.viewContext
        appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    }
    
    
    func AddContact(newContact: Contact){
        
        let entityContact = NSEntityDescription.entity(forEntityName: "CDContact", in: context)
        
        let person = NSManagedObject(entity: entityContact!, insertInto: context)
        person.setValue(newContact.firstName, forKey:"firstname")
        person.setValue(newContact.lastName, forKey:"lastname")
        person.setValue(newContact.mobileNo, forKey:"mobileno")

        do {
            try context.save()
            print("Added")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    func retrieveContact()->[Contact]?{
        
        var contactList:[Contact] = [];

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do{
            let NScontactList = try context.fetch(fetchRequest)
            for object in NScontactList {
                let contact:Contact = Contact(firstname: object.value(forKey: "firstname") as! String, lastname: object.value(forKey: "lastname") as! String, mobileno: object.value(forKey: "mobileno") as! String);
                contactList.append(contact);
            }
            
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")

        }
        return contactList
    }
    
    func updateContact(mobileno:String, newContact: Contact) {
        let updateRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        
        updateRequest.predicate = NSPredicate(format: "mobileno = %@", mobileno)
        
        do {
            let results = try context.fetch(updateRequest)
            
            if results.count != 0 { // Atleast one was returned
                for item in results{
                    item.setValue(newContact.firstName, forKey: "firstname")
                    item.setValue(newContact.lastName, forKey: "lastname")
                    item.setValue(newContact.mobileNo, forKey: "mobileno")
                }
            }
        } catch {
            print("Fetch Failed: \(error)")
        }

        do {
            try context.save()
           }
        catch {
            print("Saving Core Data Failed: \(error)")
        }
    }
    
    func deleteContact(mobileno:String) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", mobileno)

        do{
            let results = try context.fetch(fetchRequest) as! [NSManagedObject]
            if(results.count != 0){
                for object in results {
                    context.delete(object)
                }
            }
            
            
        }catch {
            print("Fetch Failed: \(error)")
        }
    }
}
