//
//  ToDoApp.swift
//  ToDo
//
//  Created by Stehling, Brennan on 6/14/21.
//
import SwiftUI
import ToDoViews

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
            ///When use @EnvironmentObject, must use this.
            ToDoMainView().environmentObject(createEnvironment())
        }
    }

    private func createEnvironment() -> ToDoEnvironment {
        let env = ToDoEnvironment()
        env.save(toDoItem: ToDoItem(priority: .high, text: "Eat breakfast"))
        env.save(toDoItem: ToDoItem(priority: .medium, text: "Eat lunch"))
        env.save(toDoItem: ToDoItem(priority: .low, text: "Eat dinner"))
        return env
    }
}

