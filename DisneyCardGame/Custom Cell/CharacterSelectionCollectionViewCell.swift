//
//  CharacterSelectionCollectionViewCell.swift
//  DisneyCardGame
//
//  Created by Carla Lyra on 1/14/21.
//

import UIKit

class CharacterSelectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    
    func displayImage(character: Character) {
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.image = character.photo
    }
    
}
