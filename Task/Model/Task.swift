//
//  Task.swift
//  Task
//
//  Created by Curt McCune on 5/25/22.
//

import Foundation

class Task: Codable {
    
    init(name: String, notes: String? = nil, dueDate: Date? = nil) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
    }
    
    var name: String
    var notes: String?
    var dueDate: Date?
    var isComplete = false
}

extension Task: Equatable {}

func ==(rhs:Task, lhs:Task) -> Bool {
    return rhs.name == lhs.name
}
