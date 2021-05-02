//
//  CharacterCollectionViewController.swift
//  GOTgame
//
//  Created by James Phillips on 4/28/21.
//

import UIKit

class CharacterCollectionViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var questionView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    var characters : [Character] = []
    let jedi = CharacterController.sharedInstance.jedi
    let sith = CharacterController.sharedInstance.sith
    let questions = QuestionController.sharedInstance.questions
    var targetedCharacter : Character?
    var question : Question?
    var section : [[Character]] {[jedi,sith]}
    var dataSource : UICollectionViewDiffableDataSource<Section,Character>!
    
    //MARK: - Enum
    enum Section {case main}
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        updateViews()
        configureCollectionViewDateSource()
    }
    
    //MARK: - Functions and Helpers
    func presentAlert(for character: Character) {
        guard let question =  question else { return }
        let success = character.name.rawValue == question.answer
        
        let correctAlert  = UIAlertController(title: "That's correct", message: "Good Job.", preferredStyle: .alert)
                                              
        let inCorrectAlert  = UIAlertController(title: "Sorry,that not it.",
                                                message: "Use the force.", preferredStyle: .alert)
                                                
        let cancelAction = UIAlertAction(title: "Done", style: .cancel, handler: nil)
        let playAction = UIAlertAction(title: "Play", style: .default) { (_) in
            self.getANewQuestion()
            self.updateViews()
        }
        
        correctAlert.addAction(playAction)
        correctAlert.addAction(cancelAction)
        inCorrectAlert.addAction(cancelAction)
        
        
        if success {
            present(correctAlert, animated: true)
        }else {
            present(inCorrectAlert, animated: true)
        }
       
    }
    
    func filter(_ questions: [Question],for character: Character) -> [Question] {
        return questions.filter{$0.answer == character.name.rawValue}
    }
    
    func setupQuestion(for character: Character){
        let index = filter(questions, for: character)
        question = index[0]
    }
    
    func getANewQuestion() {
        targetedCharacter = characters.randomElement()
        guard let character = targetedCharacter else {return}
        setupQuestion(for: character)
    }
    
    func updateViews() {
        questionTitleLabel.text = question?.title
        
        questionView.text       = question?.question
    }
    
    func setUpData()  {
        collectionView.delegate = self
        characters += jedi.filter{$0.faction == .Jedi}
        characters += sith.filter{$0.faction == .Sith}
        getANewQuestion()
        collectionView.collectionViewLayout = configureLayout()
        view.backgroundColor = .black
    }
    
    //MARK: - CollectionView Layout
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
    
    //MARK: - DataSource
    func configureCollectionViewDateSource(){
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
//MARK: - Extensions
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
            presentAlert(for: character)
            cell.isSelected = true
        }
    }
}

