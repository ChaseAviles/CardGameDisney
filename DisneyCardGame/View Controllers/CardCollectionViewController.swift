//
//  CardCollectionViewController.swift
//  DisneyCardGame
//
//  Created by Carla Lyra on 1/14/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class CardCollectionViewController: UICollectionViewController {
    
    //MARK: -Properties
    var displayCharacters: [Character] = []
    var targetCharacter: Character?
    var selectedFaction = "villains"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        shuffleCharacters(faction: faction: selectedFaction)
        
    }
    
    func shuffleCharacters(faction: String) {
        if faction == "heroes"{
            let heroesShuffleGroup = CharacterController.heroes.shuffled()
            let heroesGroup = heroesShuffleGroup.prefix(3)
            displayCharacters = Array(heroesGroup)
            targetCharacter = CharacterController.villains.randomElement()
        } else {
            let villainsShuffleGroup = CharacterController.villains.shuffled()
            let villainsGroup = villainsShuffleGroup.prefix(3)
            displayCharacters = Array(villainsGroup)
            targetCharacter = CharacterController.heroes.randomElement()
        }
        updateViews()
    }
    
    func updateViews() {
        guard let character = targetCharacter else { return }
        displayCharacters.append(character)
        displayCharacters.shuffle()
        title = "Find \(character.name)"
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destination = segue.destination as? FilterViewController
            destination?.delegate = self
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return displayCharacters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterSelectionCollectionViewCell else { return UICollectionViewCell()}
        
        let char = displayCharacters[indexPath.row]
        
        cell.displayImage(character: char)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = displayCharacters[indexPath.row]
        presentAlert(character: character)
    }
    
    func presentAlert(character: Character) {
        let sucess = character == targetCharacter
        let alertController = UIAlertController(title: sucess ? "Good job!" : "Try again", message: nil, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Suffle", style: .default) { (_) in
            self.shuffleCharacters(faction: self.selectedFaction)
        }
        alertController.addAction(doneAction)
        
        if sucess {
            alertController.addAction(shuffleAction)
        }
        present(alertController, animated: true, completion: nil)
    }
} //end of class

//MARK: -Extension
extension CardCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 20, height: width + 30)
    }
}

extension CardCollectionViewController: FilterSelectionDelegate {
    func selectedFaction(faction: String) {
        selectedFaction = faction
        shuffleCharacters(faction: faction)
    }
}
