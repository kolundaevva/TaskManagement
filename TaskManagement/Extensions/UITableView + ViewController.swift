//
//  UITableView + ViewController.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 18.04.2022.
//

import UIKit

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtredTasks.isEmpty ? 0 : filtredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? CustomTableViewCell else { fatalError() }
        
        let task = filtredTasks[indexPath.row]
        cell.configuration(with: task)
        
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let task = filtredTasks[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (_, _, _) in
            StorageManager.deleteObject(task)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (_, _, _) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let newTaskVC = storyboard.instantiateViewController(withIdentifier: "NewTaskVC") as? NewTaskViewController else { return }
            newTaskVC.currentTask = task
            DispatchQueue.main.async {
                tableView.reloadData()
            }
            self?.show(newTaskVC, sender: nil)
        }
        
        editAction.backgroundColor = UIColor.gray
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell
        let task = filtredTasks[indexPath.row]
        cell?.checkmark.image = UIImage(systemName: !task.isDone ? "checkmark.circle" : "circle")
        try! realm.write {
            task.isDone.toggle()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
