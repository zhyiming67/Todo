//
//  SwiftUIView.swift
//  
//
//  Created by Stehling, Brennan on 6/14/21.
//

import SwiftUI

/// Display a row in the Todo list.
public struct ToDoListRow: View {
    ///Binding one TodoItem in the list.
    @Binding var toDoItem: ToDoItem

    public var body: some View {
        HStack{
            switch toDoItem.priority {
            case .low:
                VStack{
                    Rectangle().frame(width: 8.0).foregroundColor(.blue)
                }
                Spacer().frame(width: 5)
                HStack {
                    Image(systemName: "l.circle").foregroundColor(.blue)
                    Text(toDoItem.text)
                }
            case .medium:
                VStack{
                    Rectangle().frame(width: 8.0).foregroundColor(.yellow)
                }
                Spacer().frame(width: 5)
                HStack {
                    Image(systemName: "m.circle").foregroundColor(.yellow)
                    Text(toDoItem.text)
                }
            case .high:
                VStack{
                    Rectangle().frame(width: 8.0).foregroundColor(.red)
                }
                Spacer().frame(width: 5)
                HStack {
                    Image(systemName: "h.circle").foregroundColor(.red)
                    Text(toDoItem.text)
                }
            }
        }
    }
}

struct ToDoListRow_Previews: PreviewProvider {
    static var previews: some View {
        let item = ToDoItem(text: "Eat breakfast")
        ToDoListRow(toDoItem: .constant(item))
    }
}
