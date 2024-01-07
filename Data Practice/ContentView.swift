//
//  ContentView.swift
//  Data Practice
//
//  Created by Andy Dobbs on 1/6/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
    @Query private var todos: [Todo]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(todos) { todo in
                    NavigationLink {
                        Text(todo.title)
                    } label: {
                        Text(todo.title)
                    }
                }
                .onDelete(perform: deleteTodos)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTodo) {
                        Label("Add Todo", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addTodo() {
        withAnimation {
            let newTodo = Todo(title: "Take a nap")
            modelContext.insert(newTodo)
        }
    }

    private func deleteTodos(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Todo.self, inMemory: true)
}
