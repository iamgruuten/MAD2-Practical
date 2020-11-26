//
//  FriendController.swift
//  Telegramme
//
//  Created by Apple on 26/11/20.
//



import UIKit
import CoreData

class FriendController{
    
    var appDelegate:AppDelegate
    var context:NSManagedObjectContext
    
    
    init() {
        context = appDelegate.persistentContainer.viewContext
        appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    }
    
    func AddFriend(friend:Friend){
        let entityContact = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)
        
        let friend = NSManagedObject(entity: entityContact!, insertInto: context)
        friend.setValue(friend.name, forKey:"name")
        friend.setValue(friend.profileImageName, forKey: "profileImageName")
        do {
            try context.save()
            print("Added")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func AddMessageToFriend(friend:Friend, message:Message) {
        let entity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)
        
        let messageFriend = NSManagedObject(entity: entity!, insertInto: context)
        
        messageFriend.setValue(message.date, forKey:"date")
        messageFriend.setValue(message.isSender, forKey: "isSender")
        messageFriend.setValue(message.text, forKey: "text")
        
        //Assign message to the friend
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.name)
        
        
        do {
            let friendList = try context.fetch(fetchRequest)
            let friend = friendList[0]
            messageFriend.setValue(friend, forKey: "friend")
            try context.save()
            print("Added")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func retrieveMessageByFriend(friend:Friend) -> [Message] {
        let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"CDFriend")
        fetchRequest.predicate = NSPredicate(format: "name = %@", friend.name)
        
        do{
            let messageList = try context.fetch(fetchRequest);
            let message = messageList[0];
            message.value(forKey: "message")
            message.value(forKey: "lastmessage")

            print(message)
        }catch let error as NSError{
            print(error)
        }
        
    }
}
