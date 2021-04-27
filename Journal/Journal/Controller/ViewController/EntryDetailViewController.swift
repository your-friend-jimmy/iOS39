//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by James Phillips on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry : Entry?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        nameTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text, !name.isEmpty else { return  }
        guard let body = bodyTextView.text, !body.isEmpty else { return  }
        
        if let entry = entry {
            entry.title = name
            entry.bodyText = body
            EntryController.sharedController.updateEntry(entry)
        }else {
            EntryController.sharedController.createEntry(title: name, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews()  {
        guard let entry = entry else { return  }
        guard let name = nameTextField.text else { return }
        guard let body = bodyTextView.text  else { return  }
        entry.title = name
        entry.bodyText = body
    }
}
