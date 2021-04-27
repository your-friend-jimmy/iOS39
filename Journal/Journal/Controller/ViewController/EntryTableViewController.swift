//
//  EntryTableViewController.swift
//  JournalCoreData
//
//  Created by James Phillips on 4/26/21.
//

import UIKit

class EntryTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.sharedController.fetchEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EntryController.sharedController.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        let entry = EntryController.sharedController.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? EntryDetailViewController, let indexPath = tableView.indexPathForSelectedRow  else { return }
            let entry = EntryController.sharedController.entries[indexPath.row]
            destinationVC.entry = entry
        }
    }
    
}
