//
//  NewTaskViewController.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 18.04.2022.
//

import UIKit

class NewTaskViewController: UITableViewController {

    var currentTask: Task!
    
    @IBOutlet weak var taskTitleLabel: UITextField!
    @IBOutlet weak var taskDefinitionLabel: UITextField!
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.isEnabled = false
        taskTitleLabel.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        setupEditScreen()
        initTF()
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func saveTask() {
        let newTask = Task(title: taskTitleLabel.text!, definition: taskDefinitionLabel.text, time: taskDatePicker.date)
        
        if currentTask != nil {
            try! realm.write {
                currentTask?.title = taskTitleLabel.text!
                currentTask?.definition = taskDefinitionLabel.text
                currentTask.time = taskDatePicker.date
            }
        } else {
            StorageManager.saveObject(newTask)
        }
    }
    
    private func setupEditScreen() {
        tableView.separatorStyle = .none
        
        if currentTask != nil {
            setupNavigationBar()
            taskTitleLabel.text = currentTask?.title
            taskDefinitionLabel.text = currentTask?.definition
            taskDatePicker.date = currentTask.time
        } else {
            taskDatePicker.date = SupportManager.startOfTheDay()
        }
    }
    
    private func setupNavigationBar() {
      if let topItem = navigationController?.navigationBar.topItem {
        topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
      }
      navigationItem.leftBarButtonItem = nil
      title = currentTask?.title
      saveButton.isEnabled = true
    }
}

//MARK: Text Field Delegate

extension NewTaskViewController: UITextFieldDelegate {
    
    private func initTF() {
        self.taskTitleLabel.delegate = self
        self.taskDefinitionLabel.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        if taskTitleLabel.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
