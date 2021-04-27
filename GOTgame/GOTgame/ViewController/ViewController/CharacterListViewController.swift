//
//  CharacterListViewController.swift
//  GOTgame
//
//  Created by James Phillips on 4/25/21.
//

import UIKit

class CharacterListViewController: UIViewController {
    private var displayedCharacters : [Character] = []
    private var targetCharacter : Character?
    private var selectedFaction = "House Stark"
    @IBOutlet weak var characterCollectionView: UICollectionView!
    private var question : Question?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCharacters()
    }
    
    func shuffleCharacters()  {
        let charactersGroup = CharacterController.characters.prefix(3)
        displayedCharacters = Array(charactersGroup)
        question = QuestionController.questions.randomElement()
        guard let questionGOT = question else { return  }
        let characterIndex = questionGOT.answer
        targetCharacter = CharacterController.characters[characterIndex]
        
        updateViews()
    }
    
    func updateViews()  {
        guard let character = targetCharacter, let questionGot = question else {return}
        displayedCharacters.append(character)
        displayedCharacters.shuffle()
        characterCollectionView.reloadData()
        title = questionGot.name
    }
    
    func presentAlert(for character: Character)  {
        let success = character == targetCharacter
        let alertController = UIAlertController(title: success ? "Good Job":"Better luck next time", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { _ in
            self.shuffleCharacters()
        }
        alertController.addAction(doneAction)
        if success {alertController.addAction(shuffleAction) }
        present(alertController, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else {return UICollectionViewCell()}
        let character = displayedCharacters[indexPath.row]
        
        cell.displayImage(for: character)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath){
        let character = displayedCharacters[indexPath.row]
        presentAlert(for: character )
    }
    
}
extension CharacterListViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 15, height: width + 120)
    }
}
extension CharacterListViewController : FilterSelectionDelegate {
    func selected(faction: String) {
        shuffleCharacters()
    }
    
    
}
