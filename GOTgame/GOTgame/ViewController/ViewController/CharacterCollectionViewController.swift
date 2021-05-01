//
//  CharacterCollectionViewController.swift
//  GOTgame
//
//  Created by James Phillips on 4/28/21.
//

import UIKit

class CharacterCollectionViewController: UIViewController {
    
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var questionView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let jedi = CharacterController.sharedInstance.jedi
    let sith = CharacterController.sharedInstance.sith
    var section : [[Character]] {[jedi,sith]}
    var characters : [Character] = []
    var question : Question? {
        get {
            getNextQuestion()
        }
    }
    var dataSource : UICollectionViewDiffableDataSource<Section,Character>!
    
    enum Section {case main}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        setUpData()
        configureDateSource()
        getNextQuestion()
        collectionView.collectionViewLayout = configureLayout()
        view.backgroundColor = .black
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //
    //    }
    
    func presentAlert(character: Character) {
        guard let question = question else {return}
        let success = character.name == question.answer
        let correctAlert  = UIAlertController(title: "That's correct", message: "Good Job.", preferredStyle: .alert)
        let inCorrectAlert  = UIAlertController(title: "Sorry, not the droid we are looking for.", message: "Strong in the force you are not!", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:)
        let playAction = UIAlertAction(title: "Play", style: .default)
        
        correctAlert.addAction(cancelAction)
        correctAlert.addAction(playAction)
        inCorrectAlert.addAction(cancelAction)
        inCorrectAlert.addAction(playAction)
        
        if success {
            present(correctAlert, animated: true)
        }else {
            present(inCorrectAlert, animated: true)
        }
    }
    
    func getNextQuestion()-> Question? {
        guard let question =
                QuestionController.sharedInstance.questions.randomElement() else {return nil }
        questionTitleLabel.text = question.title
        questionView.text = question.question
        print("\(question.answer)")
        return question
    }
    
    func setUpData()  {
        characters += jedi.filter{$0.faction == .Jedi}
        characters += sith.filter{$0.faction == .Sith}
    }
    
    func configureLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let columns = 3
        let groupHeight  =  NSCollectionLayoutDimension.fractionalWidth(0.4)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func configureDateSource(){
        dataSource = UICollectionViewDiffableDataSource<Section,Character>(collectionView: self.collectionView){
            (collectionView, indexPath, character) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"characterCell",for: indexPath) as? CharacterCollectionViewCell else {return UICollectionViewCell()}
            
            cell.displayImage(for: character)
            
            return cell
        }
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section,Character>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(jedi)
        initialSnapshot.appendItems(sith)
        
        dataSource.apply(initialSnapshot, animatingDifferences: false)
    }
    
}

extension CharacterCollectionViewController: UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCollectionViewCell else {return UICollectionViewCell()}
        
        if let character = dataSource.itemIdentifier(for: indexPath){
            cell.displayImage(for: character)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CharacterCollectionViewCell {
            let character = characters[indexPath.row]
            presentAlert(character: character)
            cell.isSelected = true
        }
    }
}

