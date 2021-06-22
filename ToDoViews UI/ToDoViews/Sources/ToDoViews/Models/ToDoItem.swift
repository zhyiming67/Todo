//
//  File.swift
//  
//
//  Created by Stehling, Brennan on 6/14/21.
//
import Foundation

/// Priority of Todo item.
public enum ToDoPriority: String, CaseIterable {
    case low
    case medium
    case high
}

/// Defination of Todo item. Contains id(unique, automatically generated), priority and text.
public struct ToDoItem: Identifiable, Hashable {
    public let id: String
    public var priority: ToDoPriority
    public var text: String
    public var completed: Bool
    
    public init(id: String? = nil, priority: ToDoPriority? = nil, text: String? = nil) {
        self.id = id ?? UUID().uuidString
        self.priority = priority ?? .medium
        self.text = text ?? ""
        self.completed = false
    }
}

public typealias ToDoItems = [ToDoItem]

extension ToDoItem: CustomStringConvertible {
    public var description: String {
        "\(text), \(priority) [\(id)]"
    }
}
