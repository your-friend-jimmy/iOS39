//
//  FilterViewController.swift
//  GOTgame
//
//  Created by James Phillips on 4/25/21.
//

import UIKit

protocol FilterSelectionDelegate : class {
    func selected(faction: String)
}
class FilterViewController: UIViewController {
    weak var delegate : FilterSelectionDelegate?
    
    @IBAction func starkButtonTapped(_ sender: UIButton) {
        delegate?.selected(faction: "stark")
        self.dismiss(animated: true)
    }
    
    @IBAction func targaryenButtonTapped(_ sender: UIButton) {
        delegate?.selected(faction: "targaryen")
        self.dismiss(animated: true)
    }
    
}
