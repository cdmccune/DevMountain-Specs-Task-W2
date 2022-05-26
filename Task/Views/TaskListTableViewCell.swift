//
//  TaskListTableViewCell.swift
//  Task
//
//  Created by Curt McCune on 5/26/22.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskListTableViewCell)
}

class TaskListTableViewCell: UITableViewCell {

    weak var delegate: TaskCompletionDelegate?
    
    @IBOutlet var taskNameLabel: UILabel!
    @IBOutlet var completionButton: UIButton!
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let task = task {
            taskNameLabel.text = task.name
            
            task.isComplete ? completionButton.setImage(UIImage(named: "complete"), for: .normal) : completionButton.setImage(UIImage(named: "incomplete"), for: .normal)
            completionButton.contentHorizontalAlignment = .fill
            completionButton.contentVerticalAlignment = .fill
        }
    }
    
    
    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
}
