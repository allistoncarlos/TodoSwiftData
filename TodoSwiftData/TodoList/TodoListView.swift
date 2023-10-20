//
//  TodoListView.swift
//  TodoSwiftData
//
//  Created by Alliston Aleixo on 20/10/23.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @State private var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.todos, id: \.id) { todo in
                Text(todo.task)
            }
            .navigationDestination(for: String.self) { todoId in
                TodoEditView(modelContext: viewModel.modelContext)
            }
            .navigationTitle("To-Do")
            .toolbar {
                Button(action: {}) {
                    NavigationLink(value: String()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    init(modelContext: ModelContext) {
        let viewModel = ViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    let container = try! ModelContainer(for: Todo.self)
    return TodoListView(modelContext: container.mainContext)
}
