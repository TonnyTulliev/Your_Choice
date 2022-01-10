//
//  PlayerRealm.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 10.01.2022.
//

import Foundation
import RealmSwift

class PlayerRealm: Object{
  @objc dynamic var name = ""
  @objc dynamic var color = ""
  var task = [String]()
}
