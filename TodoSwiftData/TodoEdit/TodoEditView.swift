//
//  TodoEditView.swift
//  TodoSwiftData
//
//  Created by Alliston Aleixo on 20/10/23.
//

import SwiftUI
import SwiftData

struct TodoEditView: View {
    @State private var viewModel: ViewModel
    
    var priorities = ["❗️", "‼️", "❗️❗️❗️"]
    
    var body: some View {
        Form {
            TextField("Tarefa", text: $viewModel.todo.task)
                .autocapitalization(.none)
            
            DatePicker("Data", selection: $viewModel.todo.date)

            Picker("Prioridade", selection: $viewModel.todo.priority) {
                ForEach(Array(priorities.enumerated()), id: \.element) { index, element in
                    Text(element).tag(index)
                }
            }
            .pickerStyle(.segmented)

            Section(
                footer:
                Button("Salvar") {
                    Task {
                        await viewModel.save()
                    }
                }
            ) {
                EmptyView()
            }
        }
        .navigationTitle(viewModel.todo.task.isEmpty ? "Nova Tarefa" : viewModel.todo.task)
    }
    
    init(modelContext: ModelContext) {
        let viewModel = ViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    let container = try! ModelContainer(for: Todo.self)
    return TodoEditView(modelContext: container.mainContext)
}
