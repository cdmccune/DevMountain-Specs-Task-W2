//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Curt McCune on 5/25/22.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet var taskNameTextField: UITextField!
    @IBOutlet var taskNotesTextView: UITextView!
    @IBOutlet var taskDueDatePicker: UIDatePicker!
    
    var task: Task?
    var date: Date?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateviews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let task = task {
            if taskNameTextField.text != "" {
                TaskController.shared.update(task: task, name: taskNameTextField.text!, notes: taskNotesTextView.text, dueDate: date)
            }
        } else {
            if taskNameTextField.text != "" {
                TaskController.shared.createTaskWith(name: taskNameTextField.text!, notes: taskNotesTextView.text, dueDate: date)
            }
        }
        self.navigationController?.popViewController(animated: true)
        
        
    }
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    func updateviews() {
        if let task = task {
            taskNameTextField.text = task.name
            taskNotesTextView.text = task.notes
            if let date = task.dueDate {
            taskDueDatePicker.date = date
            }
        }
    }
}


