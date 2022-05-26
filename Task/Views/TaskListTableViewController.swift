//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Curt McCune on 5/25/22.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskController.shared.loadfromPersistentStorage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.task = TaskController.shared.tasks[indexPath.row]
        cell.delegate = self
//        content.text = TaskController.shared.tasks[indexPath.row].name
//        cell.contentConfiguration = content
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.delete(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "createEntry" {
            if let index = tableView.indexPathForSelectedRow {
                if let TaskDetailVC = segue.destination as? TaskDetailViewController {
                    let task = TaskController.shared.tasks[index.row]
                    TaskDetailVC.task = task
                    print("Task Passed!")
                }
            }
        }
        
    }
    

}

extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ sender: TaskListTableViewCell) {
        guard let task = sender.task else {
            return
        }
        TaskController.shared.toggleIsComplete(task: task)
        sender.updateViews()
    }
  
}
