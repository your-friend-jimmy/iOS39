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
    
    weak var itemCompletionDelegate:ItemCompletionDelegate?
    
    var item : Item? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func completionButtonTapped(_ sender: UIButton) {
        if let delegate = itemCompletionDelegate {
            delegate.itemCellButtonTapped(self)
        }
    }
    
    func updateViews()  {
        if let newItem = item  {
            setUpButtonImage(for: newItem)
            itemLabel.text = newItem.name
            ItemController.sharedInstance.saveToPersistenceStore()
        }
    }
    
    func setUpButtonImage(for item: Item) {
        let config = UIImage.SymbolConfiguration(scale: .large)
        let incomplete = UIImage(systemName: "rectangle", withConfiguration: config)
        let complete = UIImage(systemName: "checkmark.rectangle", withConfiguration: config)
        itemComplete.setImage(item.isComplete ? complete:incomplete, for:.normal)
    }
}
