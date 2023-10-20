//
//  TodoListViewModel.swift
//  TodoSwiftData
//
//  Created by Alliston Aleixo on 20/10/23.
//

import Foundation
import SwiftData

extension TodoListView {
    @Observable
    class ViewModel {
        var modelContext: ModelContext
        var todos = [Todo]()
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            
            fetchData()
        }
        
        func fetchData() {
            do {
                let descriptor = FetchDescriptor<Todo>(
                    sortBy: [SortDescriptor(\.creationDate)]
                )
                
                todos = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
            }
        }
    }
}
