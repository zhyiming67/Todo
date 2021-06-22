//
//  SwiftUIView.swift
//  
//
//  Created by Stehling, Brennan on 6/14/21.
//

import SwiftUI

/// Display the detail of a todo item.
public struct ToDoItemDetail: View {
    @EnvironmentObject var environment: ToDoEnvironment

    @State var id: String? = nil
    @State var priority: ToDoPriority = .medium
    @State var text: String = ""
    ///Control Save button
    var saveDisabled: Bool {
        text.isEmpty
    }
    
    /// Todo item detail view. Control add or update a Todo item.
    public var body: some View {
        NavigationView {
            VStack {
                ///Use ToDoItemPriorityPicker to display/edit priority.
                ToDoItemPriorityPicker(priority: $priority)
                ///Display/edit task.
                TextField("Task", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 50.0)
                Spacer()
                .navigationTitle("ToDo Item")
                .navigationBarTitleDisplayMode(.inline)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        ///Values are binding. When cancel, selectedToDoItem should be nil.
                        environment.selectedToDoItem = nil
                        environment.showingDetail = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    ///Use ToDoEnvironment to update/add to the list.
                    Button(action: {
                        let item = ToDoItem(id: id, priority: priority, text: text)
                        print("Saving Item: \(item)")
                        environment.save(toDoItem: item)
                    }, label: {
                        Text("Save")
                    })
                    .disabled(saveDisabled)
                }
            }
        }
        ///Get selected Todo item information which is the current Todo item.
        .onAppear {
            if let item = environment.selectedToDoItem {
                print("Loading Item: \(item)")
                id = item.id
                priority = item.priority
                text = item.text
            }
        }
    }
}

struct ToDoItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemDetail().environmentObject(ToDoEnvironment())
    }
}
