//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Apple on 24/11/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AddData()
        FetchData()
    }

    func AddData(){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entityPerson = NSEntityDescription.entity(forEntityName: "Person", in: context)
        
        let person = NSManagedObject(entity: entityPerson!, insertInto: context)
        person.setValue("Hello", forKey:"name")
        person.setValue("23", forKey:"age")
        person.setValue("173cm", forKey:"height")

        
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func FetchData(){
        var people:[NSManagedObject] = []
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do{
            people = try context.fetch(fetchRequest)
            
            for p in people{
                let name = p.value(forKey: "name") as? String
                let age = p.value(forKey: "age") as? String
                let height = p.value(forKey: "height") as? String
                print("\(String(describing: name)), \(String(describing: age)), \(String(describing: height))")
            }
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
}

