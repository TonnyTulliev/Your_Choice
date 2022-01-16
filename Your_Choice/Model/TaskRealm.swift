//
//  TaskRealm.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 16.01.2022.
//

import Foundation
import RealmSwift

class TaskRealm: Object{
  @objc dynamic var taskName = ""
  @objc dynamic var category = ""
}
