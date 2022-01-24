//
//  Player.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 28.12.2021.
//

import Foundation

class Player{
    let name: String
    let color: String
    let task: [String?]
    
    init(name: String, color: String, task:[String?] ) {
        self.name = name
        self.color = color
        self.task = task
    }
}
