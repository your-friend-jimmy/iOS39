//
//  ItemDetailViewController.swift
//   Anchor Point 2
//
//  Created by James Phillips on 4/23/21.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    var item : Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let nameText = nameTextField.text, !nameText.isEmpty else { return  }
        if let item = item {
            ItemController.sharedInstance.update(item: item, name: nameText)
            ItemController.sharedInstance.saveToPersistenceStore()
            navigationController?.popViewController(animated: true)
        }else {
            ItemController.sharedInstance.createItemWith(name: nameText)
            ItemController.sharedInstance.saveToPersistenceStore()
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        nameTextField.text = ""
    }
    
    func updateViews() {
        nameTextField.text = item?.name
    }
}
