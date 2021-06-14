//
//  ContentView.swift
//  Todo
//
//  Created by Zhu, Yiming on 6/11/21.
//

import SwiftUI
import Amplify
import Combine

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
                 .onAppear {
                     self.performOnAppear()
             }
    }
    
    @State var todoSubscription: AnyCancellable?
    
    func subscribeTodos() {
       self.todoSubscription
           = Amplify.DataStore.publisher(for: Todo.self)
               .sink(receiveCompletion: { completion in
                   print("Subscription has been completed: \(completion)")
               }, receiveValue: { mutationEvent in
                   print("Subscription got this value: \(mutationEvent)")

                   do {
                     let todo = try mutationEvent.decodeModel(as: Todo.self)

                     switch mutationEvent.mutationType {
                     case "create":
                       print("Created: \(todo)")
                     case "update":
                       print("Updated: \(todo)")
                     case "delete":
                       print("Deleted: \(todo)")
                     default:
                       break
                     }

                   } catch {
                     print("Model could not be decoded: \(error)")
                   }
               })
    }
    
    func performOnAppear() {
        subscribeTodos()
    }
    
//    create Todo
//    func performOnAppear() {
//        create Todo
//        let item = Todo(name: "Finish quarterly taxes",
//                       priority: .high,
//                       description: "Taxes are due for the quarter next week")
//
//        Amplify.DataStore.save(item) { result in
//           switch(result) {
//           case .success(let savedItem):
//               print("Saved item: \(savedItem.name)")
//           case .failure(let error):
//               print("Could not save item to DataStore: \(error)")
//           }
//        }
//    }
    
//    query Todo
//    func performOnAppear() {
//        Amplify.DataStore.query(Todo.self, where: Todo.keys.priority.eq(Priority.high)) { result in
//           switch(result) {
//           case .success(let todos):
//               for todo in todos {
//                   print("==== Todo ====")
//                   print("Name: \(todo.name)")
//                   if let priority = todo.priority {
//                       print("Priority: \(priority)")
//                   }
//                   if let description = todo.description {
//                       print("Description: \(description)")
//                   }
//               }
//           case .failure(let error):
//               print("Could not query DataStore: \(error)")
//           }
//       }
//    }
    
//    updata Todo
//    func performOnAppear() {
//        Amplify.DataStore.query(Todo.self,
//                                where: Todo.keys.name.eq("Finish quarterly taxes")) { result in
//            switch(result) {
//            case .success(let todos):
//                guard todos.count == 1, var updatedTodo = todos.first else {
//                    print("Did not find exactly one todo, bailing")
//                    return
//                }
//                updatedTodo.name = "File quarterly taxes"
//                Amplify.DataStore.save(updatedTodo) { result in
//                    switch(result) {
//                    case .success(let savedTodo):
//                        print("Updated item: \(savedTodo.name)")
//                    case .failure(let error):
//                        print("Could not update data in DataStore: \(error)")
//                    }
//                }
//            case .failure(let error):
//                print("Could not query DataStore: \(error)")
//            }
//        }
//    }
    
//    delete Todo
//    func performOnAppear() {
//        Amplify.DataStore.query(Todo.self,
//                                where: Todo.keys.name.eq("File quarterly taxes")) { result in
//            switch(result) {
//            case .success(let todos):
//                guard todos.count == 1, let toDeleteTodo = todos.first else {
//                    print("Did not find exactly one todo, bailing")
//                    return
//                }
//                Amplify.DataStore.delete(toDeleteTodo) { result in
//                    switch(result) {
//                    case .success:
//                        print("Deleted item: \(toDeleteTodo.name)")
//                    case .failure(let error):
//                        print("Could not update data in DataStore: \(error)")
//                    }
//                }
//            case .failure(let error):
//                print("Could not query DataStore: \(error)")
//            }
//       }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

