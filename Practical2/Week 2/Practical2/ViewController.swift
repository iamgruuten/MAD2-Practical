//
//  ViewController.swift
//  Practical2
//
//  Created by Apple on 27/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    //Friend List
    
    var friendList = [Friend]()
    
    //Declare 5 Friend object
    var friend1 = Friend (firstname: "Jason",lastname: "Teo" ,age: 16, description: "IT Diploma")
    var friend2 = Friend (firstname: "Quan Sheng",lastname: "Lee",age: 20, description: "IT Diploma")
    var friend3 = Friend(firstname: "Eugene",lastname: "Lee" ,age: 17, description: "IT Diploma")
    var friend4 = Friend(firstname: "Jeya",lastname: "Subra" ,age: 20, description: "IT Diploma")
    var friend5 = Friend(firstname: "Yu Min", lastname: "Tan" ,age: 16, description: "IT Diploma\n")
    var average = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        friendList.append(friend1)
        friendList.append(friend2)
        friendList.append(friend3)
        friendList.append(friend4)
        friendList.append(friend5)
        
        displayFriends(friendList: friendList)
        displayFriendsUnder20(friendList: friendList)
        average = findAverage(friendList: friendList)
        print(average)
    }

    func displayFriends(friendList:[Friend]){
        for friend in friendList {
            print(friend.firstName, " " ,friend.lastName, " ", friend.age, " ", friend.description)
            
        }
    }
    
    func displayFriendsUnder20(friendList:[Friend]){
        print("Friends under 20")
        for friend in friendList{
            if friend.age < 20{
                print(friend.firstName, " " ,friend.lastName, " ", friend.age, " ", friend.description)
            }
        }
    }
    
    func findAverage(friendList:[Friend]) ->  Double{
        var total = 0;
        
        for friend in friendList{
            total += friend.age
        }
        
        return Double(total) / Double(friendList.count)
    }
}

