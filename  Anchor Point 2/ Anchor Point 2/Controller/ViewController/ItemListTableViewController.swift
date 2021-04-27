//
//  ItemListTableViewController.swift
//   Anchor Point 2
//
//  Created by James Phillips on 4/23/21.
//

import UIKit

class ItemListTableViewController: UITableViewController {
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemController.sharedInstance.loadFromPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    @IBAction func createNewItemButtonTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add new item", message: "Please enter an item for your list.", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style:.default) { _ in
            if let nameTextField = alertController.textFields?.first, let name = nameTextField.text{
                if name != ""{
                ItemController.sharedInstance.createItemWith(name: name)
                ItemController.sharedInstance.saveToPersistenceStore()
                self.tableView.reloadData()
                }
            }
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemController.sharedInstance.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemTableViewCell else {return UITableViewCell()}
        let item = ItemController.sharedInstance.items[indexPath.row]
        cell.itemCompletionDelegate = self
        cell.item = item
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let itemToDelete = ItemController.sharedInstance.items[indexPath.row]
            ItemController.sharedInstance.delete(item: itemToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let index = tableView.indexPathForSelectedRow{
                guard let destinationVC = segue.destination as? ItemDetailViewController else { return }
                let itemToSend = ItemController.sharedInstance.items[index.row]
                destinationVC.item = itemToSend
            }
        }
    }
}
    
    extension ItemListTableViewController : ItemCompletionDelegate {
        func itemCellButtonTapped(_ sender: ItemTableViewCell) {
            guard let item = sender.item else { return }
            ItemController.sharedInstance.toggleIsComplete(item: item)
            sender.updateViews()
        }
    }
