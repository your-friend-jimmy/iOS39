//
//  ItemTableViewCell.swift
//   Anchor Point 2
//
//  Created by James Phillips on 4/23/21.
//

import UIKit

protocol ItemCompletionDelegate: AnyObject {
    func itemCellButtonTapped(_ item: ItemTableViewCell)
}

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemComplete: UIButton!
    
    weak var delegate: ItemCompletionDelegate?
    
    var item : Item? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func completionButtonTapped(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.itemCellButtonTapped(self)
        }
    }
    
    func updateViews()  {
        if let newItem = item  {
            let incomplete = UIImage(systemName: "rectangle")
            let complete = UIImage(systemName:"checkmark.rectangle" )
            itemLabel.text = newItem.name
            itemComplete.setImage(newItem.isComplete ? complete: incomplete, for: .normal)
            ItemController.sharedInstance.saveToPersistenceStore()
        }
    }
}
