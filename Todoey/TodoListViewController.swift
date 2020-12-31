//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
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
    
    //Function that identifies which row has been selected by user & and the following action to be performed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //This is how I access each row
        print(itemArray[indexPath.row])
        
        //Creates momentary animation on selected row
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Conditional that adds or delets a checkmark to row
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    }
    

}

