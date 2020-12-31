//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Creates the number of rows by determining and returning the number of items in the itemArray
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //Creates a reusable cell, populates each cell with items from itemArray
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    //Delegate method that identifies which row has been selected by user & and the following action to be performed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //itemArray[indexPath.row] = How to access each row
        
        //Creates momentary animation on selected row
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Conditional that adds or delets a checkmark to row
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    //MARK: - Add  New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        // local variable to addButtonPressed func to pass contents of alertTextField to other function in this block
        var textField = UITextField()
        
        //Creates a UIAlert when the addButton is pressed
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        //Creates a text field inside the UIAlert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item"
            textField = alertTextField
        }
        
        //What will happen when the user clicks the "Add Item" button on the UIAlert
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //When button is pressed itemArray is appended and screen is reloaded to reflect new data addition (if add item text field is empty an empty string will be appended.. not ideal)
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
}

