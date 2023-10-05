//
//  ViewController.swift
//  Todo App
//
//  Created by CEMTREX on 05/10/23.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray=[Item]()
//    let defaults=UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newItem1=Item()
        newItem1.title="Get grocery"
        itemArray.append(newItem1)
        let newItem2=Item()
        newItem2.title="Prepare for Meal"
        itemArray.append(newItem2)
        let newItem3=Item()
        newItem3.title="Go to office"
        itemArray.append(newItem3)
        
        loadItems()
//        if let items=defaults.array(forKey: "TodoListArray") as? [Item]{
//            itemArray=items
//        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "TodoItem", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text=item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done{ // is true
//            cell.accessoryType.accessoryType = .checkmark
//        }else{
//            cell.accessoryType.accessoryType = .none
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if itemArray[indexPath.row].done==false{
//            itemArray[indexPath.row].done=true
//        }else{
//            itemArray[indexPath.row].done=false
//        }
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Add new item to list
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var textField   = UITextField()
        let alert       = UIAlertController(title: "Add To-do", message: "", preferredStyle: .alert)
        let action      = UIAlertAction(title: "Add item", style: .default) { (action) in
//            print("Success!")
            let newItem=Item()
            newItem.title=textField.text!
            self.itemArray.append(newItem)
            self.saveItems()
            
//            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
        }
        alert.addTextField{
            (alertTextField) in
            alertTextField.placeholder="Create new item"
            textField=alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems(){
        let encoder=PropertyListEncoder()
        do{
            let data=try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }catch{
            print("Error encoding itemArray")
        }
        tableView.reloadData()
    }
    
    func loadItems(){
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do{
                itemArray=try decoder.decode([Item].self, from: data)
            }catch{
                print("Error decoding itemArray")
            }
            
        }
    }
    

}

