//
//  TodoEditViewModel.swift
//  TodoSwiftData
//
//  Created by Alliston Aleixo on 20/10/23.
//

import Foundation
import SwiftData

extension TodoEditView {
    @Observable
    class ViewModel {
        var modelContext: ModelContext
        
        var todo: Todo
        
        init(modelContext: ModelContext, todo: Todo = Todo()) {
            self.modelContext = modelContext
            self.todo = todo
        }
        
        func save() async {
            modelContext.insert(self.todo)
        }
    }
}
