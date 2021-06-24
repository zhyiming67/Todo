// swiftlint:disable all
import Amplify
import Foundation

public struct ToDoItem: Model {
  public let id: String
  public var priority: ToDoPriority?
  public var text: String?
  public var completed: Bool?
  
  public init(id: String = UUID().uuidString,
      priority: ToDoPriority? = nil,
      text: String? = nil,
      completed: Bool? = nil) {
      self.id = id
      self.priority = priority
      self.text = text
      self.completed = completed
  }
}