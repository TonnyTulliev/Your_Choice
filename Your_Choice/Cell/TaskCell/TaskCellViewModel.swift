//
//  TaskCellViewModel.swift
//  Your_Choice
//
//  Created by Антон Скуратов on 20.01.2022.
//

import Foundation
import UIKit

final class TaskCellViewModel {
    
    var taskText: String
    var taskType: String
    var isSelected: Bool
    var id: Int
    
    init(taskText: String, taskType:String , isSelected: Bool, id: Int){
        self.taskText = taskText
        self.taskType = taskType
        self.isSelected = isSelected
        self.id = id 
    }
}
