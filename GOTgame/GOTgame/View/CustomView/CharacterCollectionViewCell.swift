//
//  CharacterCollectionViewCell.swift
//  GOTgame
//
//  Created by James Phillips on 4/25/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var characterImageView: UIImageView!
    
    
    
    func displayImage(for character: SWCharacterController.SWCharacter )  {
        characterImageView.image = character.photo
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
    }
    
}
