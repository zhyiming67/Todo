//
//  SwiftUIView.swift
//  
//
//  Created by Stehling, Brennan on 6/14/21.
//

import SwiftUI

public struct ToDoItemPriorityPicker: View {
    @Binding var priority: ToDoPriority

    public var body: some View {
        Picker("Priority", selection: $priority) {
            Text(String(describing: ToDoPriority.low))
                .tag(ToDoPriority.low)
            Text(String(describing: ToDoPriority.medium))
                .tag(ToDoPriority.medium)
            Text(String(describing: ToDoPriority.high))
                .tag(ToDoPriority.high)
        }
            .frame(height: 50.0)
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
    }
}

struct ToDoItemPriorityPicker_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemPriorityPicker(priority: .constant(.medium))
    }
}
