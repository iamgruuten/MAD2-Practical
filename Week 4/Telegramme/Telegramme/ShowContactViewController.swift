//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by Apple on 12/11/20.
//

import UIKit

var appDelegate = UIApplication.shared.delegate as! AppDelegate;

class ShowContactViewController : UITableViewController, UIGestureRecognizerDelegate{
        
    override func viewDidLoad(){
        super.viewDidLoad();
        
        //Setting a gesture on hold
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        longPressGesture.minimumPressDuration = 1.0 // 1 second press
        longPressGesture.delegate = self
        self.tableView.addGestureRecognizer(longPressGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData();
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = appDelegate.contactList[indexPath.row]
        
        cell.textLabel!.text = "\(contact.firstName)\(contact.lastName)"
        
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Are you sure to Delete?", message: "You are deleting a contact from the list", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            appDelegate.contactList.remove(at: indexPath.item)
            print("Delete: " + appDelegate.contactList[indexPath.item].firstName)
            self.tableView.reloadData();

        }))
        
        self.present(alert, animated: true)

    }
    
    @objc func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {

        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {

            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Content", bundle:nil)

                
                let updateView  = storyBoard.instantiateViewController(withIdentifier: "update") as! updateContactController
                
                self.present(updateView, animated: true, completion: nil)
                updateView.updateContactControllerDelegate = self;
                
                updateView.updateContact(itemIndex: indexPath.row)


            }
        }
    }
}


extension ShowContactViewController : updateContactDelegate{
    func didSendMessage(_ message:String) {
            print("Contact is updated view " + message)
            self.tableView.reloadData();
    }
}
