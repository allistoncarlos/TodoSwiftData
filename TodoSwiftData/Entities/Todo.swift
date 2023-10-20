//
//  Todo.swift
//  TodoSwiftData
//
//  Created by Alliston Aleixo on 20/10/23.
//

import Foundation
import SwiftData

@Model
class Todo {
    var task: String
    var date: Date
    var creationDate: Date
    var priority: Int
    
    init(
        task: String = "",
        date: Date = .now,
        priority: Int = 10
    ) {
        self.task = task
        self.date = date
        self.priority = priority
        
        self.creationDate = .now
    }
}
