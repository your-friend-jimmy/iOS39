//
//  CharacterCollectionViewController.swift
//  GOTgame
//
//  Created by James Phillips on 4/28/21.
//

import UIKit

class CharacterCollectionViewController: UIViewController {
    enum Section: CaseIterable {case main}
    
    //MARK: - Outlets
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var questionView: UITextView!
    @IBOutlet weak var characterCollectionView: UICollectionView!
    
    
    
    //MARK: - Properties
    let characterController = SWCharacterController()
    var dataSource : UICollectionViewDiffableDataSource<Section, SWCharacterController.SWCharacter>!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        characterCollectionView.collectionViewLayout = configureLayout()
        configureCollectionViewDateSource()
        view.backgroundColor = .black
        self.characterCollectionView.delegate = self
        //self.characterCollectionView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        characterCollectionView.reloadData()
        
    }
    

 }
    
    
extension CharacterCollectionViewController  {

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
        dataSource = UICollectionViewDiffableDataSource<Section,SWCharacterController.SWCharacter>(collectionView: characterCollectionView){
            (collectionView: UICollectionView, indexPath: IndexPath, Idenifier: SWCharacterController.SWCharacter) -> UICollectionViewCell? in

                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: "characterCell",
                        for: indexPath) as? CharacterCollectionViewCell
            
            
            cell?.displayImage(for: self.characterController.characters[indexPath.row])
            
            
                    return cell
        }
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section,SWCharacterController.SWCharacter>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(characterController.characters)
        
        
        dataSource.apply(initialSnapshot, animatingDifferences: false)
    }
    
     
    
}
    //MARK: - CollectionView fuctions
extension CharacterCollectionViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let char = characterController.characters[indexPath.row]
        print(char.name.rawValue)
    }
    
}
