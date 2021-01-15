//
//  Character Controller.swift
//  DisneyCardGame
//
//  Created by Carla Lyra on 1/14/21.
//

import UIKit

class CharacterController {
static let heroes = [
                    Character(name: "Hercules", photo: UIImage(named: "hercules"), faction: "heroes"),
                     Character(name: "Tarzan", photo: UIImage(named: "tarzan"), faction: "heroes"),
                     Character(name: "Elsa", photo: UIImage(named: "elsa"), faction: "heroes"),
                     Character(name: "Anna", photo: UIImage(named: "anna"), faction: "heroes"),
                     Character(name: "Rapunzel", photo: UIImage(named: "rapunzel"), faction: "heroes"),
                     Character(name: "Ariel", photo:  UIImage(named: "ariel"), faction: "heroes"),
                     Character(name: "Jasmine", photo:  UIImage(named: "jasmine"), faction: "heroes"),
                     Character(name: "Alladin", photo:  UIImage(named: "alladin"), faction: "heroes") ]

static let villains = [ Character(name: "Maleficent", photo:  UIImage(named: "maleficent"), faction: "villains"),
                        Character(name: "Ursula", photo:  UIImage(named: "ursula"), faction: "villains"),
                        Character(name: "Jafar", photo:  UIImage(named: "jafar"), faction: "villains"),
                        Character(name: "Hook", photo:  UIImage(named: "hook"), faction: "villains"),
                        Character(name: "Scar", photo:  UIImage(named: "scar"), faction: "villains"),
                        Character(name: "Yzma", photo:  UIImage(named: "yzma"), faction: "villains"),
                        Character(name: "Hades", photo:  UIImage(named: "hades"), faction: "villains"),
                        Character(name: "Cruella", photo:  UIImage(named: "cruella"), faction: "villains") ]
}
