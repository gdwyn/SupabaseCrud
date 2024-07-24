//
//  viewModel.swift
//  SupabaseCRUD
//
//  Created by Godwin IE on 23/07/2024.
//

import Foundation
import Supabase

extension HomeView {
    class ViewModel: ObservableObject {
        @Published var todos: [Todo] = []
        
        // create todo
        func createTodo(withID id: Int, andTitle title: String) {
            Task {
                let todo = Todo(id: id, title: title, done: false)
                
                try await supabase
                    .from("todos")
                    .insert(todo)
                    .execute()
        
                DispatchQueue.main.async {
                    self.todos.append(todo)
                }
            }
        }
        
        // fetch todos
        func fetchTodos() async throws {
            let query = try? await supabase
                .from("todos")
                .select()
                .execute()
            
            guard
                let response = query?.data,
                let todos = try? JSONDecoder().decode([Todo].self, from: response)
            else {
                print ("unable to decode todo")
                return
            }
            
            DispatchQueue.main.async {
                self.todos = todos
            }
        }
        
        // update todo
        func updateTodo(withID id: Int) {
            Task {
                try await supabase
                    .from("todos")
                    .update([
                        "title" : "updated"
                    ])
                    .eq("id", value: "\(id)")
                    .execute()
            }
        }
        
        // delete todo
        func deleteTodo(withID id: Int) {
            Task {
                try await supabase
                    .from("todos")
                    .delete()
                    .eq("id", value: "\(id)")
                    .execute()
            }
        }
    }
}
