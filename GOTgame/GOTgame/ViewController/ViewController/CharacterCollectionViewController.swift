//
//
//  CharacterListViewController.swift
//  GOTgame
//
//  Created by James Phillips on 4/25/21.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {
    var character : Character?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    func presentAlert(character: Character){
        let characterAlert  = UIAlertController(title:"GOT Character",message: "\(character.name)",preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        characterAlert.addAction(cancelAction)
        present(characterAlert, animated: true)
    }

    

    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell()}
        let character = CharacterController.characters[indexPath.row]
        
        cell.displayImage(for: character)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath){
        let character = CharacterController.characters[indexPath.row]
        presentAlert(character: character)
    }
    
}
extension CharacterCollectionViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 15, height: width + 120)
    }
}

