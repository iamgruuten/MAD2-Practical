//
//  HistoryTableViewController.swift
//  Revision2
//
//  Created by Apple on 11/12/20.
//

import UIKit


class HistoryTableViewController:UITableViewController{
    var appDelegate:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate

    let userController:UserController = UserController();
    var transactionList:[Transaction] = [Transaction]();
    override func viewDidLoad(){
        super.viewDidLoad();
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        transactionList = userController.RetrieveAllTransactionsbyUser(user: appDelegate.user)
        self.tableView.reloadData();
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath)
        
        let transaction = transactionList[indexPath.row]
        
        cell.textLabel!.text = "\(transaction.payee)"
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"

        let myString = formatter.string(from: transaction.date)
        print(transaction.amount)
        print(myString)
        cell.detailTextLabel!.text = "$\(transaction.amount) paid on \(myString)";

        return cell;
    }
}
