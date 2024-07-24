//
//  ContentView.swift
//  SupabaseCRUD
//
//  Created by Godwin IE on 23/07/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var title = ""
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Create todo") {
                viewModel.createTodo(withID: Int.random(in: 1...1000), andTitle: title)
            }
            
            List(viewModel.todos) { todo in
                Text(todo.title)
                    .swipeActions(allowsFullSwipe: false) {
                        
                        Button("update") {
                            viewModel.updateTodo(withID: todo.id)
                            Task {
                                try? await viewModel.fetchTodos()
                            }
                        }
                        .tint(.blue)
                        
                        Button("Delete") {
                            viewModel.updateTodo(withID: todo.id)
                            Task {
                                viewModel.deleteTodo(withID: todo.id)
                            }
                        }
                        .tint(.red)
                        
                    }
            }
            .listStyle(.plain)
            .refreshable {
                try? await viewModel.fetchTodos()
            }
        }
        .padding()
        .task {
            try? await viewModel.fetchTodos()
        }
    }
}

#Preview {
    HomeView()
}
