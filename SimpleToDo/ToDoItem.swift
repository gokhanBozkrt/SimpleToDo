//
//  ToDoItem.swift
//  SimpleToDo
//
//  Created by Gökhan Bozkurt on 21.04.2023.
//

import Foundation

struct ToDoItem: Codable,Identifiable,Hashable {
    enum Priority: String,Codable,CaseIterable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }
    var id = UUID()
    var title = "New Title"
    var priority = Priority.medium
    var isComplete = false
    
    var icon: String {
        if isComplete {
            return "checkmark.square"
        } else {
            switch priority {
            case .low:
                return "arrow.down.square"
            case .medium:
                return "square"
            case .high:
                return "exclamationmark.square"
            }
        }
    }
    static let example = ToDoItem()
}
