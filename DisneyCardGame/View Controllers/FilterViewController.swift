//
//  FilterViewController.swift
//  DisneyCardGame
//
//  Created by Carla Lyra on 1/14/21.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    func selectedFaction(faction: String)
}

class FilterViewController: UIViewController {
    
    weak var delegate: FilterSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func villainButton(_ sender: Any) {
        delegate?.selectedFaction(faction: "villains")
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func heroesButton(_ sender: Any) {
        delegate?.selectedFaction(faction: "heroes")
        self.dismiss(animated: true, completion: nil)
    }
}//end of class
