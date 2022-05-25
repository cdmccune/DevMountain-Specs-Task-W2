//
//  TaskController.swift
//  Task
//
//  Created by Curt McCune on 5/25/22.
//

import Foundation

class TaskController {
    static var shared = TaskController()
    
    var tasks = [Task]()
    
    
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let task = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(task)
        savetoPersistentStorage()
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.dueDate = dueDate
        task.notes = notes
        savetoPersistentStorage()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        savetoPersistentStorage()
    }
    
    func delete(task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks.remove(at: index)
        }
        savetoPersistentStorage()
    }
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filename = "task.json"
        let fullURL = documentsDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    func savetoPersistentStorage() {
        let je = JSONEncoder()
        
        do {
            let data = try je.encode(tasks)
            try data.write(to: fileURL())
        } catch let e {
            print(e)
        }
    }
    
    func loadfromPersistentStorage() {
        do {
            let data = try Data(contentsOf: fileURL())
            let jd = JSONDecoder()
            let tasks = try jd.decode([Task].self, from: data)
            self.tasks = tasks
        } catch let e {
            print(e)
        }
    }
}
