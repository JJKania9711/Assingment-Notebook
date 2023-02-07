//
//  ContentView.swift
//  Assingment Notebook
//
//  Created by James on 1/17/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var toDoList = ToDoList()
    [ToDoList(priority: "High", description: "Take out trash", dueDate: Date()), ToDoItem(priority: "Medium", description: "Pick up clothes", dueDate: Date()), ToDoItem(priority: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoList) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.priority)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                    
                    .onMove { indices, newOffset in
                        toDoList.items.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    
                    .onDelete { indexSet in
                        toDoList.items.remove(atOffsets: indexSet)
                    }
                    
                }
                .navigationBarTitle("To Do List")
                .navigationBarItems(leading: EditButton())
            }
        }
    }
}

    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    struct ToDoItem: Identifiable {
        var id = UUID()
        var priority = String()
        var description = String()
        var dueDate = Date()
    }
    
    

