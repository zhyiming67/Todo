//
//  File.swift
//  
//
//  Created by Stehling, Brennan on 6/14/21.
//
import Foundation

class ObservableArray<T>: ObservableObject {
    @Published var array: [T]
    init(array: [T] = []) {
        self.array = array
    }
    init(repeating value: T, count: Int) {
        array = Array(repeating: value, count: count)
    }
}

/// Maintain all Todo information used in each view.
public class ToDoEnvironment: ObservableObject {
    ///Control ToDoItemDetail show or not. Used in ToDoList and ToDoItemDetail.
    @Published var showingDetail: Bool = false
    ///Store ToDoItems
    @Published var toDoItems: ToDoItems = []
    ///Store current Todo item information. Display in ToDoItemDetail.
    @Published var selectedToDoItem: ToDoItem? = nil
    private var showTime = 3.0
    
    public init() {}
    
    /// Check id to determine update or add.
    /// - Parameter toDoItem: New one from ToDoItemDetail through Save button.
    public func save(toDoItem: ToDoItem) {
        let index = toDoItems.firstIndex {
            $0.id == toDoItem.id
        }
        if let index = index {
            print("Updating Item: \(toDoItem)")
            toDoItems[index] = toDoItem
        } else {
            print("Adding Item: \(toDoItem)")
            toDoItems.append(toDoItem)
            ///Create a Todo to DataStore
//            createTodo(toDoItem)
        }
        ///Sort as H M L
        toDoItems.sort(by: {
            switch $0.priority {
            case ToDoPriority.low:
                return false
            case ToDoPriority.medium:
                if $1.priority == ToDoPriority.low {
                    return true
                }
                else {
                    return false
                }
            case ToDoPriority.high:
                return true
            }
        })
        
        print("Saved item!")
        logItems()
        showingDetail = false
    }

    public func remove(toDoItem: ToDoItem) {
        if let index = toDoItems.firstIndex(of: toDoItem) {
            toDoItems.remove(at: index)
            print("Removed item!")
            logItems()
            showingDetail = false
        }
    }

    public func remove(at indexSet: IndexSet) {
        toDoItems.remove(atOffsets: indexSet)
        logItems()
    }
    
//    public func createTodo(toDoItem: ToDoItem) {
//        Amplify.DataStore.save(toDoItem) { result in
//                   switch(result) {
//                   case .success(let savedItem):
//                       print("Saved item: \(savedItem.text)")
//                   case .failure(let error):
//                       print("Could not save item to DataStore: \(error)")
//                   }
//                }
//    }
    
//    public func remove(at index: Array<ToDoItem>.Index) {
//        toDoItems.remove(at: index)
//        logItems()
//    }
    
//    public func disappear(toDoItem: ToDoItem) {
//        let _delay = RunLoop.SchedulerTimeType(.init(timeIntervalSinceNow: showTime))
////        RunLoop.main.schedule(after: _delay) {
//            if let index = self.toDoItems.firstIndex(of: toDoItem) {
//                if self.toDoItems[index].completed {
//                    self.toDoItems.remove(at: index)
//                }
//                print("Item disappear!")
//                self.logItems()
//            }
////        }
//    }
    
    private func logItems() {
        let items = toDoItems.map {
            String(describing: $0)
        }.joined(separator: "\n")
        print("Items: \(toDoItems.count)\n\(items)")
    }
}
