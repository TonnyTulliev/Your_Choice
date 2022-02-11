//
//  PlayerInfo.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 11.02.2022.
//

import Foundation
import UIKit

struct PlayerInfo {
    
    static var shared = PlayerInfo()
    var userName: String?
    var userId: String?
    
    private init() { }
    
    mutating func saveUsersInfo(userNames: [String : Any], usersId: [String : Any] ) {
        for value in userNames.values {
            if let value = value as? String {
                userName = value
            }
        }
        for value in usersId.values {
            if let value = value as? String {
                userId = value
            }
        }
    }
}
