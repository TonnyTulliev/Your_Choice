//
//  TaskRealBase.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 21.01.2022.
//

import Foundation
import RealmSwift

class TaskRealmBase: Object {
    
  @objc dynamic var id = 0
  @objc dynamic var taskName = ""
  @objc dynamic var category = ""
  
}
