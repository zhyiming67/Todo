//
//  SwiftUIView.swift
//  
//
//  Created by Stehling, Brennan on 6/14/21.
//
import SwiftUI

/// Homepage. Control Add button and TodoList.
public struct ToDoMainView: View {
    @EnvironmentObject var environment: ToDoEnvironment

    public init() {}

    public var body: some View {
        NavigationView {
            ToDoList()
                .navigationTitle("ToDo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add") {
                            print("Add new ToDo item")
                            environment.selectedToDoItem = nil
                            environment.showingDetail = true
                        }
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
        }
    }
    
}

struct ToDoMainView_Previews: PreviewProvider {
    static var previews: some View {
        let env = ToDoEnvironment()
        env.save(toDoItem: ToDoItem(text: "Eat breakfast"))
        return ToDoMainView().environmentObject(env)
    }
}
